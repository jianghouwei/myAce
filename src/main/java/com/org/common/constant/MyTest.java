package com.org.common.constant;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface MyTest {

	//String isNull default "default";
	
	 /**
     * 是否能为空字符串
     * @return
     */
    boolean isCanEmpty() default true;
}
