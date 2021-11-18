package com.myboard.etfboard.scheduler;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class scheduler {
	/*
	@Scheduled(cron = "0 * * * * *")
	public void autoUpdate() {
		LocalDateTime now = LocalDateTime.now();
		System.out.println(now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")));
	}
	*/
	
	@Scheduled(fixedDelay = 60*60*1000) // 1시간마다 실행
	public void autoUpdate() {
		LocalDateTime now = LocalDateTime.now();
		System.out.println(now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")));
	}
}
