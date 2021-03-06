System.setProperty 'mail.smtp.port', '587'
System.setProperty 'mail.smtp.starttls.enable', 'true'

dataSource {
	//username="root"
	//password="exito"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password = "exito"
		
            //dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/inapcom_medfireweb"//"jdbc:mysql://localhost/mefireweb"
            
        }
    }
    test {
        dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password = "exito"
            dbCreate = "create-drop"
            url = "jdbc:mysql://localhost/mefireweb"
        }
    }
    production {
        dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"//username = "inapcom_root"
			password = "exito"//password = "DomPomoSkiby2011"
            //dbCreate = "update"
            //url = "jdbc:mysql://localhost/mefireweb"
            url = "jdbc:mysql://192.168.1.98/inapcom_medfireweb"
			properties {
				maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "SELECT 1"
                                testOnBorrow = true
                                testWhileIdle = true
                                testOnReturn = true                                
			}
        }
    }
	
	dbdiff {
		dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			username = "inap"
			password = "exito"
			url = "jdbc:mysql://10.0.0.199/cimahost"
		}
		
	}
}


