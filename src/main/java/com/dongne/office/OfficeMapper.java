package com.dongne.office;

import java.util.List;
import java.util.Map;

public interface OfficeMapper {

	int create(OfficeDTO dto);

	int update(OfficeDTO dto);

	int delete(int oid);

	List<OfficeDTO> list(Map map);

	OfficeDTO read(int oid);

}
