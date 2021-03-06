package com.dongne.jumin;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfiguration {
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		// 해당 경로에 tiles.xml 파일을 넣음
		configurer.setDefinitions(new String[] { "classpath:/tiles/tiles_user.xml", "classpath:/tiles/tiles_notice.xml",
				"classpath:/tiles/tiles_club.xml", "classpath:/tiles/tiles_market.xml",
				"classpath:/tiles/tiles_office.xml", "classpath:/tiles/tiles_tour.xml",
				"classpath:/tiles/tiles_community.xml", "classpath:/tiles/tiles_fboard.xml",
				"classpath:/tiles/tiles_message.xml" });

		configurer.setCheckRefresh(true);
		return configurer;

	}

	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}
}