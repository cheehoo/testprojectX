package com.wedding.web;

import com.wedding.domain.Rsvp;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RsvpController_Roo_Controller {
    
    @RequestMapping(value = "/rsvp", method = RequestMethod.POST)
    public String RsvpController.create(@Valid Rsvp rsvp, BindingResult result, ModelMap modelMap) {
        if (rsvp == null) throw new IllegalArgumentException("A rsvp is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("rsvp", rsvp);
            modelMap.addAttribute("rsvp_confirmed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "rsvp/create";
        }
        rsvp.persist();
        return "redirect:/rsvp/" + rsvp.getId();
    }
    
    @RequestMapping(value = "/rsvp/form", method = RequestMethod.GET)
    public String RsvpController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("rsvp", new Rsvp());
        modelMap.addAttribute("rsvp_confirmed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "rsvp/create";
    }
    
    @RequestMapping(value = "/rsvp/{id}", method = RequestMethod.GET)
    public String RsvpController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("rsvp_confirmed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("rsvp", Rsvp.findRsvp(id));
        return "rsvp/show";
    }
    
    @RequestMapping(value = "/rsvp", method = RequestMethod.GET)
    public String RsvpController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("rsvps", Rsvp.findRsvpEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Rsvp.countRsvps() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("rsvps", Rsvp.findAllRsvps());
        }
        modelMap.addAttribute("rsvp_confirmed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "rsvp/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RsvpController.update(@Valid Rsvp rsvp, BindingResult result, ModelMap modelMap) {
        if (rsvp == null) throw new IllegalArgumentException("A rsvp is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("rsvp", rsvp);
            modelMap.addAttribute("rsvp_confirmed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "rsvp/update";
        }
        rsvp.merge();
        return "redirect:/rsvp/" + rsvp.getId();
    }
    
    @RequestMapping(value = "/rsvp/{id}/form", method = RequestMethod.GET)
    public String RsvpController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("rsvp", Rsvp.findRsvp(id));
        modelMap.addAttribute("rsvp_confirmed_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "rsvp/update";
    }
    
    @RequestMapping(value = "/rsvp/{id}", method = RequestMethod.DELETE)
    public String RsvpController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Rsvp.findRsvp(id).remove();
        return "redirect:/rsvp?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @RequestMapping(value = "find/ByCodeEquals/form", method = RequestMethod.GET)
    public String RsvpController.findRsvpsByCodeEqualsForm(ModelMap modelMap) {
        return "rsvp/findRsvpsByCodeEquals";
    }
    
    @RequestMapping(value = "find/ByCodeEquals", method = RequestMethod.GET)
    public String RsvpController.findRsvpsByCodeEquals(@RequestParam("code") String code, ModelMap modelMap) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("A Code is required.");
        modelMap.addAttribute("rsvps", Rsvp.findRsvpsByCodeEquals(code).getResultList());
        return "rsvp/list";
    }
    
}
