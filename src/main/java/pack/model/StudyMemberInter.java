package pack.model;

public interface StudyMemberInter {
	boolean insertStudyMember(StudyMemberDto studyMemberDto);
	boolean selectStudyExist(StudyMemberDto studyMemberDto);
	boolean selectalMember(StudyMemberDto studyMemberDto);
	int selectStudymemberno(StudyMemberDto studyMemberDto);
	
	boolean selectNoUser(StudyMemberDto studyMemberDto);

}
