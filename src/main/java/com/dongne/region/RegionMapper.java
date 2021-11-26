package com.dongne.region;

import java.util.List;
import java.util.Map;

public interface RegionMapper {
	List<RegionDTO> list();

	RegionDTO read(int nID);

}
