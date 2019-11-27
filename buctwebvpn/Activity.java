package buctwebvpn;

public class Activity {
	private String id;
	private String typeName;
	private String fName;
	private String fPushDW;
	private String fActivityStart;
	private String fActivityEnd;
	private String fActivityPlace;
	private int fCount;
	private int fNowCount;
	private String fSelfDW;
	private String fSignStart;
	private String fSignEnd;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getFName() {
		return fName;
	}
	public void setFName(String fName) {
		this.fName = fName;
	}
	public String getFPushDW() {
		return fPushDW;
	}
	public void setFPushDW(String fPushDW) {
		this.fPushDW = fPushDW;
	}
	public String getFActivityStart() {
		return fActivityStart;
	}
	public void setFActivityStart(String fActivityStart) {
		this.fActivityStart = fActivityStart;
	}
	public String getFActivityEnd() {
		return fActivityEnd;
	}
	public void setFActivityEnd(String fActivityEnd) {
		this.fActivityEnd = fActivityEnd;
	}
	public String getFActivityPlace() {
		return fActivityPlace;
	}
	public void setFActivityPlace(String fActivityPlace) {
		this.fActivityPlace = fActivityPlace;
	}
	public int getFCount() {
		return fCount;
	}
	public void setFCount(int fCount) {
		this.fCount = fCount;
	}
	public int getFNowCount() {
		return fNowCount;
	}
	public void setFNowCount(int fNowCount) {
		this.fNowCount = fNowCount;
	}
	public String getFSelfDW() {
		return fSelfDW;
	}
	public Activity(String id,String typeName, String fName, String fPushDW, String fActivityStart, String fActivityEnd, String fActivityPlace, int fCount, int fNowCount, String fSelfDW, String fSignStart,
			String fSignEnd,String status) {
		super();
		this.id = id;
		this.typeName=typeName;
		this.fName = fName;
		this.fPushDW = fPushDW;
		this.fActivityStart = fActivityStart;
		this.fActivityEnd = fActivityEnd;
		this.fActivityPlace = fActivityPlace;
		this.fCount = fCount;
		this.fNowCount = fNowCount;
		this.fSelfDW = fSelfDW;
		this.fSignStart = fSignStart;
		this.fSignEnd = fSignEnd;
		this.status=status;
	}
	public void setFSelfDW(String fSelfDW) {
		this.fSelfDW = fSelfDW;
	}
	public String getFSignStart() {
		return fSignStart;
	}
	public void setFSignStart(String fSignStart) {
		this.fSignStart = fSignStart;
	}
	public String getFSignEnd() {
		return fSignEnd;
	}
	public void setFSignEnd(String fSignEnd) {
		this.fSignEnd = fSignEnd;
	}
	
}
