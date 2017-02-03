package ua.com.vertex.context;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    private static final Logger LOGGER = LogManager.getLogger(WebAppInitializer.class);

    private static final String LOG_ERROR = "Error while creating TEMP directory";

    private static final int MAX_FILE_SIZE_BYTES = 10485760;
    private static final int MAX_REQUEST_SIZE_BYTES = 11534336;
    private static final int MAX_FILE_SIZE_NOT_WRITTEN = 0;

    public static final Path TEMP_DIR_PATH = Paths.get("c:/tempAppFolder/vertexCrm/");

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{RootConfig.class, SecurityConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{MainContext.class};
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        try {
            if (!Files.exists(TEMP_DIR_PATH)) {
                Files.createDirectories(TEMP_DIR_PATH);
            }
        } catch (IOException e) {
            LOGGER.debug(LOG_ERROR, e, e);
        }
        registration.setMultipartConfig(new MultipartConfigElement(TEMP_DIR_PATH.toString(), MAX_FILE_SIZE_BYTES,
                MAX_REQUEST_SIZE_BYTES, MAX_FILE_SIZE_NOT_WRITTEN));
    }
}
