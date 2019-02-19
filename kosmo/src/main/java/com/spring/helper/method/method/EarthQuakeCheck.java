package com.spring.helper.method.method;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class EarthQuakeCheck {

	@Autowired
	GetJsonData jsonData;
	
	private static final Logger logger = LoggerFactory.getLogger(EarthQuakeCheck.class);
	
	//지진 결과 조회
	@Scheduled(fixedDelay = 600000)
	public void earthQuakeCheck() throws Exception{
		logger.info("earthQuakeCheck 스케쥴러 실행");
		jsonData.getQuakeInfo();
	}
}
