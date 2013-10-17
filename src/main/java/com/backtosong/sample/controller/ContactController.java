package com.backtosong.sample.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.backtosong.sample.entity.Contact;
import com.backtosong.sample.service.ContactService;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;

	@RequestMapping("/editredirect/{contactId}")
	public String contactinfo(@PathVariable("contactId") Integer id, ModelMap modelMap){
		Contact Contactinfo = contactService.selectContactById(id);
		modelMap.put("contact", Contactinfo);
		return "contact_info";
	}
	
	@RequestMapping(value = "/editredirect/update", method = RequestMethod.POST)
	public String updateContact(@ModelAttribute("contact") Contact contact , BindingResult result){
		contactService.updateContact(contact);
		return "redirect:/";
	}
	
	@RequestMapping("/")
	public String listContacts(ModelMap modelMap) {
		modelMap.put("contact", new Contact());
		modelMap.put("contactList", contactService.listContact());
		
		return "contact";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("contact") Contact contact, BindingResult result) {
		contactService.addContact(contact);
		return "redirect:/";
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public void deleteContact(@RequestParam("id") Integer contactId, HttpServletResponse response) {
		try {
			contactService.removeContact(contactId);
			response.setContentType("text/json; charset=UTF-8");
			response.getWriter().print("{\"del\":\"true\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}

