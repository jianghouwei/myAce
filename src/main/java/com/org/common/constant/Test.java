package com.org.common.constant;


public class Test {

	@MyTest(isCanEmpty=true)
	private  String name ;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static void main(String[] args) {
	/*	Test test = new Test();
		test.setName(null);
		MyTest t = (MyTest) Test.class.getAnnotation(MyTest.class);
		System.out.println(t.isCanEmpty());		*/
		/*if (Test.class.isAnnotationPresent(MyTest.class)) {// 判断此类上是否存在指定的注解类
			MyTest t = (MyTest) Test.class.getAnnotation(MyTest.class);
			System.out.println(t.isCanEmpty());
		}*/
	}	
		
}
