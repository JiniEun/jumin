package com.dongne.office;

import java.util.List;
import java.util.Map;

public interface OfficeService {

	int create(OfficeDTO dto);

	int update(OfficeDTO dto);

	int delete(int oid);


	OfficeDTO read(int oid);

	List<OfficeDTO> list(Map map);

}
