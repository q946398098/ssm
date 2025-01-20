package com.martin.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class MyAdvice {

    @Pointcut("execution(* com.martin.service.impl.*.*(..))")
    private void logPt(){

    }

    public void before(){
        System.out.println("before");
    }

//    @Around("MyAdvice.logPt()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        String classNAme = pjp.getTarget().getClass().getName();
        String methodName = pjp.getSignature().getName();
        System.out.println(classNAme + "-" + methodName + "log_start");
        Object ret = pjp.proceed();
        System.out.println(classNAme + "-" + methodName +"log_end");
        return ret;
    }
}
