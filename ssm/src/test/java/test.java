import com.martin.dao.BookMapper;
import com.martin.pojo.Books;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class test {

    @Autowired
    private BookMapper bookMapper;

    @Test
    public void test1(){
        Books books = bookMapper.queryBookById(1);
        System.out.println(books);
    }


}
