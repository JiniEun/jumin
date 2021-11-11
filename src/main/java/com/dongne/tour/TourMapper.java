package com.dongne.tour;

import java.util.List;
import java.util.Map;

public interface TourMapper {

	int create(TourDTO dto);

	void upcnt(int tid);

	TourDTO read(int tid);

	int update(TourDTO dto);

	int delete(int tid);

	int total(Map map);

	List<TourDTO> list(Map map);

}
