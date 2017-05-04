echo "Packaging Bundle..."

packageNum=`./testRabbitMQClient.php backendPackage-v | xargs`
	cd temp/
	echo "MySQL Password?"
		mkdir mySqlData
			cd mySqlData/
				mysqldump -u root -p login > backup_sql.sql
				cd ..
				cd ..
	
	beScrDIR=/home/matt/git/it490_backend_final/it490_backend_final
		cp -a $beScrDIR* temp/

	tar -czvf backendPackage-v"$packageNum".tar.gz -C temp/ . 
		
		rm -r temp/it490_backend_final/
		rm -r temp/mySqlData/
        echo `ls | grep backendPackage-v"$packageNum"`
		echo "Bundle Complete"
	
	# Scp package to the deploy server
	echo "Sending to deploy server..."
	scp -r backendPackage-v"$packageNum".tar.gz uzair@192.168.2.30:/home/uzair/Packages/
	
	cp backendPackage-v"$packageNum".tar.gz backendPackages/
	rm backendPackage-v"$packageNum".tar.gz
	php updatePackage.php backendPackage-v"$packageNum".tar.gz "$packageNum"

	
