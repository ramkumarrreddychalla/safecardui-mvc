package com.safecard.web.controller;

import com.safecard.web.client.RestClient;
import com.safecard.web.vo.Branch;
import com.safecard.web.vo.Profile;
import com.safecard.web.vo.ProfileType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

	@Autowired
	RestClient restClient;
	List<Profile> profiles = null;

	public LoginController() {

	}

	@ModelAttribute("profileTypes")
	public List<ProfileType> populateDepartments()
	{
		profiles = restClient.getProfiles();
		Profile profile = profiles.get(0);
		List<ProfileType> profileTypes = profile.getProfileTypes();
		return profileTypes;
	}

	@ModelAttribute("branches")
	public List<Branch> populateBranches()
	{	profiles = restClient.getProfiles();
		Profile profile = profiles.get(0);
		List<Branch> branches = profile.getBranches();
		return branches;
	}



	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		//List<Profile> profiles = restClient.getProfiles();
		ModelAndView model = new ModelAndView("hello");
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is welcome page!");
		model.addObject("profile", profiles.get(0));

		Profile profile = profiles.get(0);
		List<Branch> branches = profile.getBranches();
		List<ProfileType> profileTypes = profile.getProfileTypes();

		Map<String,String> profiles = new LinkedHashMap<>();
		//Map<String,String> profilesDates = new LinkedHashMap<>();
		List<String> profileDates = new ArrayList<>();

		for(ProfileType profileType : profileTypes){
			profiles.put(profileType.getProfileId(), profileType.getProfileType());
			profileDates.add(profileType.getDateOfExpiry());
		}

		model.addObject("profiles", profiles);
		model.addObject("profileDates", profileDates);
		model.addObject("branches", branches);
		model.addObject("branchesLength", branches.size());
		model.addObject("profile", profile);
		model.addObject("noOfLicenses", profile.getNumLicenses());

		//model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is protected page!");
		model.setViewName("admin");
		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

}