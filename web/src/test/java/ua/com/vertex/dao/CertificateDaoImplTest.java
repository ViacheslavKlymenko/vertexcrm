package ua.com.vertex.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import ua.com.vertex.beans.Certificate;
import ua.com.vertex.context.MainTestContext;
import ua.com.vertex.dao.interfaces.CertificateDaoInf;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static junit.framework.TestCase.assertFalse;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = MainTestContext.class)
@WebAppConfiguration
@ActiveProfiles("test")
public class CertificateDaoImplTest {

    @Autowired
    private CertificateDaoInf underTest;


    @Test
    public void getAllCertificateByUserIdReturnNotNull() throws Exception {
        List<Certificate> result = underTest.getAllCertificatesByUserId(-1);
        assertNotNull("Maybe method was changed", result);
    }

    @Test
    public void getAllCertificateByUserIdReturnNotEmpty() throws Exception {
        List<Certificate> result = underTest.getAllCertificatesByUserId(1);
        assertFalse(result.isEmpty());
    }

    @Test
    public void getAllCertificateByUserIdReturnCorectData() throws Exception {
        ArrayList<Certificate> certificates = new ArrayList<>();
        certificates.add(new Certificate.Builder()
                .setCertificationId(1)
                .setUserId(0)
                .setCertificationDate(LocalDate.parse("2016-12-01"))
                .setCourseName("Java Professional")
                .setLanguage(null)
                .getInstance());

        assertEquals("Maybe method was changed",
                certificates, underTest.getAllCertificatesByUserId(1));
    }

    @Test
    public void getCertificateByIdReturnNull() throws Exception {
        if (underTest.getCertificateById(-1).isPresent())
            underTest.getCertificateById(-1).get();

    }

    @Test
    public void getCertificateByIdReturnReturnCorectData() throws Exception {
        Certificate result = new Certificate.Builder()
                .setCertificationId(1)
                .setUserId(1)
                .setCertificationDate(LocalDate.parse("2016-12-01"))
                .setCourseName("Java Professional")
                .setLanguage("Java")
                .getInstance();

        if (underTest.getCertificateById(1).isPresent()) {
            assertEquals("Maybe method was changed",
                    result, underTest.getCertificateById(1).get());
        }
    }


}