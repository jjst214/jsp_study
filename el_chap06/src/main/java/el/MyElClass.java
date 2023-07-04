package el;

public class MyElClass {
	public String getGender(String jumin) {
		String resultStr = "";
		int beginIdx = jumin.indexOf("-")+1;
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		if(Integer.parseInt(genderStr) == 1 || Integer.parseInt(genderStr) == 3) {
			resultStr = "남자";
		}else if(Integer.parseInt(genderStr) == 2 || Integer.parseInt(genderStr) == 4) {
			resultStr = "여자";
		}else {
			resultStr = "주민번호 오류입니다.";
		}
		return resultStr;
	}
}
