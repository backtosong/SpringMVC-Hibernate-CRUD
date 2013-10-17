package com.backtosong.sample.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.backtosong.sample.dao.ContactDAO;
import com.backtosong.sample.entity.Contact;
import com.backtosong.sample.service.ContactService;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactDAO contactDAO;
	
	@Transactional
	public void addContact(Contact contact) {
		contactDAO.addContact(contact);
	}

	@Transactional
	public List<Contact> listContact() {

		return contactDAO.listContact();
	}

	@Transactional
	public void removeContact(Integer id) {
		contactDAO.removeContact(id);
	}
	
	@Transactional
	public Contact selectContactById(Integer id) {
		
		return contactDAO.selectContactById(id);
	}

	@Transactional
	public void updateContact(Contact contact) {
		contactDAO.updateContact(contact);
	}
}
