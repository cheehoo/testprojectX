package com.wedding.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.wedding.domain.Rsvp;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "rsvp", automaticallyMaintainView = true, formBackingObject = Rsvp.class)
@RequestMapping("/rsvp/**")
@Controller
public class RsvpController {
}
