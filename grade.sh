CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then 
    echo 'found correct file'
else 
    # Added echo command when file isn't foun
    echo 'file not found'
    exit
fi

cp TestListExamples.java student-submission
cp Server.java student-submission
cp -r lib student-submission

cd student-submission

# Implemented OS check
if [[ "$OSTYPE" == "mysys" ]]
then
    javac -cp ";lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
else
    javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
fi


if [[ $? == 0 ]]
then
    echo 'was able to compile'
else
    echo 'compile error'
    exit
fi

# Implemented OS check
if [[ "$OSTYPE" == "msys" ]]
then
    java -cp ";lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples
else
    java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
fi