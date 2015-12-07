package com.healing.aop;

import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect				// 객체 생성을 해줘야하기 때문에 @Component 를 같이 사용한다.
public class HomeAspect {
	public static Logger logger = Logger.getLogger(HomeAspect.class.getName());
	public static final String logMsg = "LogMsg-------------";
	
	@Around("within(com.java..*)")
	public Object advice(ProceedingJoinPoint joinPoint){
		Object obj = null;
		
		try{
			logger.info(logMsg + joinPoint.getTarget().getClass().getName() + "\t" + joinPoint.getSignature().getName());
			
			obj = joinPoint.proceed();
			
		}catch(Throwable e){
			e.printStackTrace();
		}
		
		return obj;
	}
}
