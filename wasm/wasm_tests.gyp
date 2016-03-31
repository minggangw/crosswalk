{
  'targets': [
    {
      'target_name': 'xwalk_wasm_unittest',
      'type': 'executable',
      'dependencies': [
        '../../base/base.gyp:base',
        '../../content/content_shell_and_tests.gyp:test_support_content',
        '../../testing/gtest.gyp:gtest',
        '../test/base/base.gyp:xwalk_test_base',
        '../xwalk.gyp:xwalk_runtime',
      ],
      'defines': [
        'HAS_OUT_OF_PROC_TEST_RUNNER',
      ],
      'sources': [
        'test/xwalk_wasm_unittest.cc',
      ],
    },
  ],
}
