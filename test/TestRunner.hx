@:build(hx.doctest.DocTestGenerator.generateDocTests())
@:build(utest.utils.TestBuilder.build())

class TestRunner extends utest.Test {
  public static function main() {
    utest.UTest.run([new TestRunner()]);
  }

  function new() {
    super();
  }
}
