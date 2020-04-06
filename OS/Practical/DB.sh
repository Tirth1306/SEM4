#!/bin/sh


while [ 1 ]; do
	#statements
	echo "############## MENU ##############"
	echo "1. Insert"
	echo "2. Update"
	echo "3. Delete"
  echo "4. View"
	echo "5. Number of records"
	echo "0. Exit"
	echo "##################################"
	read choice

	case $choice in
		1 )
			echo -n "Enter Roll Number: "
			read rollNumber
			echo -n "Enter Name: "
			read name
			echo -n "Enter Address: "
			read address
			echo -n "Enter Age: "
			read age
			echo -n "Enter Gender: "
			read gender
			echo -n "Enter Discipline: "
			read disc
			echo -n "Enter Result: "
			read result

			echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt

			#will not give proper o/p when using cut command to retireive data
			#echo "$rollNumber	$name 	$branch" >> db.txt
			;;

		3 )
			echo -n "Enter Roll Number: "
			read rollNumber

			grep -v $rollNumber db.txt > temp.txt
			cat temp.txt > db.txt
			rm temp.txt
			echo "Data for roll number $rollNumber deleted!!"
			;;

		2 )

			echo "Enter the field you want to update:"
			echo "1.Update Roll Number"
			echo "2.Update Name"
			echo "3.Update Address"
			echo "4.Update Age"
			echo "5.Update Sex"
			echo "6.Update Discipline"
			echo "7.Update Result"

			read ch1

			case $ch1 in
				1 )
							echo -n "Enter Roll Number: "
							read rollNumber
							rn=`grep $rollNumber db.txt | cut -d ',' -f1`
              if [ "$rn" = "$rollNumber" ]
              then
						    name=`grep $rollNumber db.txt | cut -d ',' -f2`
						    address=`grep $rollNumber db.txt | cut -d ',' -f3`
								age=`grep $rollNumber db.txt | cut -d ',' -f4`
								gender=`grep $rollNumber db.txt | cut -d ',' -f5`
								disc=`grep $rollNumber db.txt | cut -d ',' -f6`
								result=`grep $rollNumber db.txt | cut -d ',' -f7`

						    grep -v $rollNumber db.txt > temp.txt
						    cat temp.txt > db.txt
						    rm temp.txt

                echo -n "Enter new Roll Number: "
                read rollNumber
                echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
                echo "File Updated Successfully!!!"
              else
                  echo "Enter a valid rollNumber!"
              fi
					;;

				2 )
					echo -n "Enter Roll Number: "
					read rollNumber
					rn=`grep $rollNumber db.txt | cut -d ',' -f1`
					if [ "$rn" = "$rollNumber" ]
					then
						name=`grep $rollNumber db.txt | cut -d ',' -f2`
						address=`grep $rollNumber db.txt | cut -d ',' -f3`
						age=`grep $rollNumber db.txt | cut -d ',' -f4`
						gender=`grep $rollNumber db.txt | cut -d ',' -f5`
						disc=`grep $rollNumber db.txt | cut -d ',' -f6`
						result=`grep $rollNumber db.txt | cut -d ',' -f7`

						grep -v $rollNumber db.txt > temp.txt
						cat temp.txt > db.txt
						rm temp.txt

						echo -n "Enter new Name: "
						read name
						echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
						echo "File Updated Successfully!!!"
					else
							echo "Enter a valid rollNumber!"
					fi
			;;

				3 )
					echo -n "Enter Roll Number: "
					read rollNumber
					rn=`grep $rollNumber db.txt | cut -d ',' -f1`
					if [ "$rn" = "$rollNumber" ]
					then
						name=`grep $rollNumber db.txt | cut -d ',' -f2`
						address=`grep $rollNumber db.txt | cut -d ',' -f3`
						age=`grep $rollNumber db.txt | cut -d ',' -f4`
						gender=`grep $rollNumber db.txt | cut -d ',' -f5`
						disc=`grep $rollNumber db.txt | cut -d ',' -f6`
						result=`grep $rollNumber db.txt | cut -d ',' -f7`

						grep -v $rollNumber db.txt > temp.txt
						cat temp.txt > db.txt
						rm temp.txt

						echo -n "Enter new Address: "
						read address
						echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
						echo "File Updated Successfully!!!"
					else
							echo "Enter a valid rollNumber!"
					fi
			;;

				4 )
					echo -n "Enter Roll Number: "
					read rollNumber
					rn=`grep $rollNumber db.txt | cut -d ',' -f1`
					if [ "$rn" = "$rollNumber" ]
					then
						name=`grep $rollNumber db.txt | cut -d ',' -f2`
						address=`grep $rollNumber db.txt | cut -d ',' -f3`
						age=`grep $rollNumber db.txt | cut -d ',' -f4`
						gender=`grep $rollNumber db.txt | cut -d ',' -f5`
						disc=`grep $rollNumber db.txt | cut -d ',' -f6`
						result=`grep $rollNumber db.txt | cut -d ',' -f7`

						grep -v $rollNumber db.txt > temp.txt
						cat temp.txt > db.txt
						rm temp.txt

						echo -n "Enter new age: "
						read age
						echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
						echo "File Updated Successfully!!!"
					else
							echo "Enter a valid rollNumber!"
					fi
			;;

			5 )
				echo -n "Enter Roll Number: "
				read rollNumber
				rn=`grep $rollNumber db.txt | cut -d ',' -f1`
				if [ "$rn" = "$rollNumber" ]
				then
					name=`grep $rollNumber db.txt | cut -d ',' -f2`
					address=`grep $rollNumber db.txt | cut -d ',' -f3`
					age=`grep $rollNumber db.txt | cut -d ',' -f4`
					gender=`grep $rollNumber db.txt | cut -d ',' -f5`
					disc=`grep $rollNumber db.txt | cut -d ',' -f6`
					result=`grep $rollNumber db.txt | cut -d ',' -f7`

					grep -v $rollNumber db.txt > temp.txt
					cat temp.txt > db.txt
					rm temp.txt

					echo -n "Enter Gender: "
					read gender
					echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
					echo "File Updated Successfully!!!"
				else
						echo "Enter a valid rollNumber!"
				fi
		;;


				6 )
					echo -n "Enter Roll Number: "
					read rollNumber
					rn=`grep $rollNumber db.txt | cut -d ',' -f1`
					if [ "$rn" = "$rollNumber" ]
					then
						name=`grep $rollNumber db.txt | cut -d ',' -f2`
						address=`grep $rollNumber db.txt | cut -d ',' -f3`
						age=`grep $rollNumber db.txt | cut -d ',' -f4`
						gender=`grep $rollNumber db.txt | cut -d ',' -f5`
						disc=`grep $rollNumber db.txt | cut -d ',' -f6`
						result=`grep $rollNumber db.txt | cut -d ',' -f7`

						grep -v $rollNumber db.txt > temp.txt
						cat temp.txt > db.txt
						rm temp.txt

						echo -n "Enter Discipline: "
						read disc
						echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
						echo "File Updated Successfully!!!"
					else
							echo "Enter a valid rollNumber!"
					fi
			;;

			6 )
				echo -n "Enter Roll Number: "
				read rollNumber
				rn=`grep $rollNumber db.txt | cut -d ',' -f1`
				if [ "$rn" = "$rollNumber" ]
				then
					name=`grep $rollNumber db.txt | cut -d ',' -f2`
					address=`grep $rollNumber db.txt | cut -d ',' -f3`
					age=`grep $rollNumber db.txt | cut -d ',' -f4`
					gender=`grep $rollNumber db.txt | cut -d ',' -f5`
					disc=`grep $rollNumber db.txt | cut -d ',' -f6`
					result=`grep $rollNumber db.txt | cut -d ',' -f7`

					grep -v $rollNumber db.txt > temp.txt
					cat temp.txt > db.txt
					rm temp.txt

					echo -n "Update Result: "
					read result
					echo "$rollNumber,$name,$address,$age,$gender,$disc,$result" >> db.txt
					echo "File Updated Successfully!!!"
				else
						echo "Enter a valid rollNumber!"
				fi
			esac
		;;

        4 )
            echo "The contents of file are:- "
            while read -r line
            do
                echo $line
            done < db.txt
            ;;

				5)
					echo "Number of Records are: "
					echo "========================"
					wc -l < db.txt
					echo "========================"
					;;
		0 )
			break;;

	esac
done
