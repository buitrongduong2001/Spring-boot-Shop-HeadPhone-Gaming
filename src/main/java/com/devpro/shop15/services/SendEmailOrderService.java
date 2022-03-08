package com.devpro.shop15.services;

import com.devpro.shop15.DTO.MailResponse;
import com.devpro.shop15.entity.AddressAccount;
import com.devpro.shop15.entity.SaleOrders;
import com.devpro.shop15.entity.Users;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Service
public class SendEmailOrderService {

    @Autowired
    private JavaMailSender sender;
    @Autowired
    private Configuration configuration;

    @Async
    public MailResponse sendEmail(Map<String,Object> model, AddressAccount account){
        MailResponse mailResponse = new MailResponse();
        MimeMessage mimeMessage = sender.createMimeMessage();
        try {
            //set mediaType
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED, StandardCharsets.UTF_8.name());
            //Add attachment
//            helper.addAttachment();
            Template t = configuration.getTemplate("send_email.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(t,model);
            helper.setTo(account.getEmail());
            helper.setText(html,true);
            helper.setSubject("Shop By Dương");
            sender.send(mimeMessage);
            System.out.println("Gửi thành công rồi ");
            mailResponse.setMessage("Gửi thành công");
            mailResponse.setStatus(Boolean.TRUE);

        }catch (MessagingException | IOException | TemplateException e){
            mailResponse.setMessage("Gửi mail lỗi: +"+e.getMessage());
            System.out.println(e.getMessage());
            mailResponse.setStatus(Boolean.FALSE);
        }
        return mailResponse;
    }


}
