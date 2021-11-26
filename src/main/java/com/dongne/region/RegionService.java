package com.dongne.region;

import java.util.List;
import java.util.Map;

public interface RegionService {
	List<RegionDTO> list();

	RegionDTO read(int nID);

}
