package com.mycat.monoeshop.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * Desc:
 *
 * @date: 27/08/2017
 * @author: Leader us
 */
@Configuration
public class MyAppConfig extends CachingConfigurerSupport {

	@Configuration
	public class DruidDataSourceConfig {
		@Bean
		@ConfigurationProperties(prefix = "spring.datasource")
		public DataSource druidDataSource() {
			DruidDataSource druidDataSource = new DruidDataSource();
			return druidDataSource;
		}
	}
}
