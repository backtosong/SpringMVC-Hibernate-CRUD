package com.backtosong.sample.dao;

import java.util.List;

import com.backtosong.sample.entity.Contact;

public interface ContactDAO {
	
	public void addContact(Contact contact);
	public List<Contact> listContact();
	public void removeContact(Integer id);
	public Contact selectContactById(Integer id);
	public void updateContact(Contact contact);
}