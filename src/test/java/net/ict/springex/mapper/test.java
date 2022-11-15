package net.ict.springex.mapper;

import lombok.extern.log4j.Log4j2;
import net.ict.springex.domain.TodoVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class test {

    @Autowired(required = false)
    private TodoMapper todoMapper;

    @Test
    public void timetest(){
    log.info(todoMapper.getTime());
    }

    @Test
    public void inserttest(){
        TodoVO vo = TodoVO.builder()
                .title("wow")
                .dueDate(LocalDate.now())
                .writer("me")
                .build();
        todoMapper.insert(vo);
    }
    @Test
    public void listtest(){
        List<TodoVO> voList = todoMapper.selectAll();
        voList.forEach(vo -> log.info(vo));
    }

    @Test
    public void deletetest(){
        todoMapper.delete(1);
    }

    @Test
    public void selecttest(){
        log.info(todoMapper.selectOne(2));
    }
}
