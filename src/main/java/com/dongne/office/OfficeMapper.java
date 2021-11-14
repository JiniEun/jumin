package com.dongne.office;

import java.util.List;

import com.dongne.office.OfficeDTO;

public interface OfficeMapper {

	int create(OfficeDTO dto);

	int update(OfficeDTO dto);

	int delete(int oid);

	List<OfficeDTO> list();

	OfficeDTO read(int oid);

}
