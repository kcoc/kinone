package com.project.kinone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.ReservDAOImpl;
import com.project.kinone.model.Reservation;

@Service
public class ReservServiceImpl implements ReservServiceInter{

	@Autowired
	private ReservDAOImpl reservDao;
	
	public List<Reservation> getSeatsList(String mcode) {
		// TODO Auto-generated method stub
		return reservDao.getSeatsList(mcode);
	}
	public int getTickets(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return reservDao.getTickets(map);
	}
	public Reservation checkReserv(Reservation reservation) {
		// TODO Auto-generated method stub
		return reservDao.checkReserv(reservation);
	}
	public int insertReserve(List<Reservation> list) {
		// TODO Auto-generated method stub
		return reservDao.insertReserve(list);
	}
	public List<Reservation> getAllTickets(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return reservDao.getAllTickets(map);
	}
	public Reservation getTheTicket(String rcode) {
		// TODO Auto-generated method stub
		return reservDao.getTheTicket(rcode);
	}
	public int cancel_reservation(String rcode) {
		// TODO Auto-generated method stub
		return reservDao.cancel_reservation(rcode);
	}
	public int getTicketsCount(int mno) {
		// TODO Auto-generated method stub
		return reservDao.getTicketsCount(mno);
	}
}
