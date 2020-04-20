
package weka.api;

//import required classes
import service.NominalPrediction;
import service.NumericPrediction;

public class ClassifyInstance2{
	static String testResult;
	
	
	public static void main(){

	//	try{
		//	testResult = NumericPrediction.numericPrediction(,);

	//}catch(Exception e){
		
		try {
			
		}catch(Exception d) {
			testResult = NominalPrediction.nominalSetPrediction();
		}
		
	//}
		 
	}


	public static String getTestResult() throws Exception {
		//main();
		return testResult;
	}
	
}

	


