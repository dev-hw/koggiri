package pack.model;


public interface FormDaoInter {
	boolean insert(FormDto dto);
	int selectInfoNo(FormDto dto);
	int getFormNo();
	
	boolean selectalSub(FormDto dto);
}
