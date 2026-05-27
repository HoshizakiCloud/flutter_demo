import 'package:flutter_gpux/flutter_gpux.dart';

class MyRenderer extends GpuRenderer {
  MyRenderer({required super.repaint});

  GpuRenderPipeline? _pipeline;

  @override
  bool render(GpuFrame frame) {
    _pipeline ??= _createPipeline(frame.device, frame.format);

    final enc = frame.device.createCommandEncoder();
    final pass = enc.beginRenderPass(colorAttachments: [
      GpuColorAttachment(
        view: frame.targetView,
        loadOp: GpuLoadOp.clear,
        storeOp: GpuStoreOp.store,
        clearValue: const GpuColor(0, 0, 0, 1),
      ),
    ]);
    pass.setPipeline(_pipeline!);
    pass.draw(vertexCount: 3);
    pass.end();
    frame.device.queue.submit([enc.finish()]);
    return true;
  }

  @override
  bool shouldUpdate(covariant MyRenderer old) => false;

  static String wgslSource = '''
    @vertex fn vs(
      @builtin(vertex_index) vertexIndex : u32
    ) -> @builtin(position) vec4f {
      let pos = array(
        vec2f( 0.0,  0.5),  // top center
        vec2f(-0.5, -0.5),  // bottom left
        vec2f( 0.5, -0.5)   // bottom right
      );

      return vec4f(pos[vertexIndex], 0.0, 1.0);
    }

    @fragment fn fs() -> @location(0) vec4f {
      return vec4f(1.0, 0.0, 0.0, 1.0);
    }
  ''';

  GpuRenderPipeline _createPipeline(GpuDevice device, GpuTextureFormat format) {
    final GpuShaderModule shader = device.createShaderModule(wgslSource);
    final GpuRenderPipelineDescriptor descriptor = GpuRenderPipelineDescriptor(
      layout: null,
      vertexModule: shader,
      vertexEntryPoint: 'vs',
      fragmentModule: shader,
      fragmentEntryPoint: 'fs',
      colorTargets: [GpuColorTargetState(format: format)]
    );
    return device.createRenderPipeline(descriptor);
  }
}