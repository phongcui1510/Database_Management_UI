package ui.database.mgm.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CombineObject {

	List<String> header;
	List<Map<String, Object>> data;
	public List<String> getHeader() {
		if (header == null) {
			header = new ArrayList<String>();
		}
		return header;
	}
	public void setHeader(List<String> header) {
		this.header = header;
	}
	public List<Map<String, Object>> getData() {
		if (data == null) {
			data = new ArrayList<Map<String, Object>>();
		}
		return data;
	}
	public void setData(List<Map<String, Object>> data) {
		this.data = data;
	}
	
	
}
