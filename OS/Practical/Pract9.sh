#!/bin/sh


while [ 1 ]; do
	#statements
	echo "############## MENU ##############"
	echo "1. Insert"
	echo "2. Update"
	echo "3. Delete"
  echo "4. View"
	echo "0. Exit"
	echo "##################################"
	read choice

	case $choice in
		1 )
			echo -n "Enter Roll Number: "
			read rollNumber
			echo -n "Enter Name: "
			read name
			echo -n "Enter Branch: "
			read branch

			echo $rollNumber"	"$name"	"$branch >> db.txt

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
			echo "3.Update Branch"
			echo "4.Update Roll Number and Name"
			echo "5.Update Name and Branch"
			echo "6.Update Branch and Roll Number"
			echo "7.Update All"
			read ch1

			case $ch1 in
				1 )
							echo -n "Enter Roll Number: "
							read rollNumber
              rno= `grep $rollNumber db.txt | cut -f1`
              if [ "$rno" = "$rollNumber" ]
              then
						    name=`grep $rollNumber db.txt | cut -f2`
						    branch=`grep $rollNumber db.txt | cut -f3`

						    grep -v $rollNumber db.txt > temp.txt
						    cat temp.txt > db.txt
						    rm temp.txt

                echo -n "Enter new Roll Number: "
                read rollNumber
                echo $rollNumber"	"$name"	"$branch >> db.txt
                echo "File Updated Successfully!!!"
              else
                  echo "Enter a valid rollNumber!"
              fi
					;;

				2 )
					echo -n "Enter Name: "
					read name
                    nm= `grep $name db.txt | cut -f2`
                    if [ "$nm" = "$name" ]
                    then
                        rollNumber=`grep "$name" db.txt | cut -f1`
                        branch=`grep "$name" db.txt | cut -f3`

                        grep -v "$name" db.txt > temp.txt
                        cat temp.txt > db.txt
                        rm temp.txt

                        echo -n "Enter new Name: "
                        read name
                        echo $rollNumber"	"$name"	"$branch >> db.txt

                        echo "File Updated Successfully!!!"
                    else
                        echo "Enter a valid Name!"
                    fi
					;;

				3 )
					echo -n "Enter Branch: "
					read branch
                    br=  `grep $branch db.txt | cut -f3`
                    if [ "$br" = "$branch" ]
                    then
                        name=`grep $branch db.txt | cut -f2`
                        rollNumber=`grep $branch db.txt | cut -f1`

                        grep -v $branch db.txt > temp.txt
                        cat temp.txt > db.txt
                        rm temp.txt

                        echo -n "Enter new Branch: "
                        read branch
                        echo $rollNumber"	"$name"	"$branch >> db.txt

                        echo "File Updated Successfully!!!"
                    else
                        echo "Enter a valid Branch"
                    fi
					;;

				4 )
					echo -n "Enter Roll Number: "
					read rollNumber

					branch=`grep $rollNumber db.txt | cut -f3`

					grep -v $rollNumber db.txt > temp.txt
					cat temp.txt > db.txt
					rm temp.txt

					echo -n "Enter new Roll Number: "
					read rollNumber

					echo -n "Enter new Name: "
					read name

					echo $rollNumber"	"$name"	"$branch >> db.txt

					echo "File Updated Successfully!!!"
					;;

				5 )
					echo -n "Enter Name: "
					read name

					rollNumber=`grep "$name" db.txt | cut -f1`


					grep -v "$name" db.txt > temp.txt
					cat temp.txt > db.txt
					rm temp.txt

					echo -n "Enter new Name: "
					read name
					echo -n "Enter new Branch: "
					read branch
					echo $rollNumber"	"$name"	"$branch >> db.txt

					echo "File Updated Successfully!!!"
					;;

				6 )
					echo -n "Enter Roll Number: "
					read rollNumber

					name=`grep $rollNumber db.txt | cut -f2`


					grep -v $rollNumber db.txt > temp.txt
					cat temp.txt > db.txt
					rm temp.txt

					echo -n "Enter new Branch: "
					read branch

					echo -n "Enter new Roll Number: "
					read rollNumber

					echo $rollNumber"	"$name"	"$branch >> db.txt

					echo "File Updated Successfully!!!"
					;;

				7 )

					echo -n "Enter Roll Number: "
					read rollNumber

					grep -v $rollNumber db.txt > temp.txt
					cat temp.txt > db.txt
					rm temp.txt

					echo -n "Enter new Roll Number: "
					read rollNumber
					echo -n "Enter new Name: "
					read name
					echo -n "Enter new Branch: "
					read branch

					echo $rollNumber"	"$name"	"$branch >> db.txt
			esac

			;;

        4 )
            echo "The contents of file are:- "
            while read -r line
            do
                echo $line
            done < db.txt
            ;;
		0 )
			break;;

	esac
done
