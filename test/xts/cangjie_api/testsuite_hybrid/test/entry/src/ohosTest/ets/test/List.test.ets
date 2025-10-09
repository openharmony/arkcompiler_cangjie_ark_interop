

import LoadABC01 from './LoadABC01.test';
import TestAbsolutePath from './TestAbsolutePath.test';
import TestArray from './TestArray.test'
import TestArrayBuffer01 from './TestArrayBuffer01.test';
import TestBigInt01 from './TestBigInt01.test';
import TestBigIntPrecision from './TestBigIntPrecision.test';
import TestException from './TestException.test';
import TestExternal from './TestExternal.test';
import TestFunction from './TestFunction.test';
import TestJSArrayRangeMismatchException from './TestJSArrayRangeMismatchException.test';
import TestJSThreadMismatchException from './TestJSThreadMismatchException.test';
import TestPostJSTask from './TestPostJSTask.test';
import TestPromise from './TestPromise.test';
import TestPromise2 from './TestPromise2.test';
import TestRegisterAfterStaticInit from './TestRegisterAfterStaticInit.test';
import TestRegisterFunc from './TestRegisterFunc.test';
import TestRegisterModule from './TestRegisterModule.test';
import TestRegisterName from './TestRegisterName.test';
import TestRegisterOverride from './TestRegisterOverride.test';
import TestRelativePath from './TestRelativePath.test';
import TestString00 from './TestString00.test';

export default function testsuite() {
  TestArray();
  TestArrayBuffer01()
  TestBigInt01()
  TestBigIntPrecision()
  TestException();
  TestJSArrayRangeMismatchException()
  TestJSThreadMismatchException()
  TestExternal()
  TestFunction()
  TestRegisterAfterStaticInit()
  TestRegisterFunc()
  TestRegisterModule()
  TestRegisterOverride()
  TestPromise()
  TestAbsolutePath()
  TestRelativePath()
  TestString00()
  LoadABC01()
  TestPostJSTask()
  TestPromise2()
  TestRegisterName()
}
