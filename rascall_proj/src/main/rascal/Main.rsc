module Main

import util::IDEServices;
import lang::java::m3::Core;
import lang::java::m3::AST;
import IO;
import List;
import Set;
import String;
import Map;

// Ast creator
list[Declaration] getASTs(loc projectLocation) {
    M3 model = createM3FromMavenProject(projectLocation);
    list[Declaration] asts = [createAstFromFile(f, true)
        | f <- files(model.containment), isCompilationUnit(f)];
    return asts;
}

public list[str] splitLinesManual(str s) {
  list[str] lines = [];
  str cur = "";
  int n = size(s);

  for (int i <- [0 .. n-1]) {
    str c = s[i];
    if (/\n/ := c) {
      lines += [cur];
      cur = "";
    }
    else if (/\r/ := c) {
      if (i + 1 < n && /\n/ := s[i+1]) {
        lines += [cur];
        cur = "";
      }
      else {
        lines += [cur];
        cur = "";
      }
    }
    else {
      cur += c;
    }
  }

  // add last line
  lines += [cur];
  return lines;
}

bool isEmptyLine(str line) = trim(line) == "";
bool isCommentLine(str line) = startsWith(trim(line), "//");
bool isMultiCommentLine(str line) = startsWith(trim(line), "/*");
bool isEndMuliComment(str line) = startsWith(trim(line), "*/");

int countNewlines(str s) {
    int i = 0;
    int count = 0;
    list[str] lines = splitLinesManual(s);
    int numLines = size(lines);
    while (i < numLines) {
        line = lines[i];
        count += 1;
        if (isEmptyLine(line) || isCommentLine(line)) {
            count -= 1;
        }
        if (isMultiCommentLine(line)) {
            count -= 1;
            while (i + 1 < numLines && !isEndMuliComment(line)) {
                i += 1;
                line = lines[i];
            }
        }
        i += 1;
    }
    return count;
}

list[int] readMeasureUnitSize(loc folder_name) {
    length_units = [];
    M3 model = createM3FromDirectory(folder_name);
    for (meth <- methods(model)) {
        method_substance = readFile(meth);

        // The method counting starts counting at 1, since otherwise it 
        //ignores the first line
        length_units += 1 + countNewlines(method_substance);
    }
    return length_units;
}

list[int] measureVolume(loc folder_name)  {
    length_files = [];
    M3 model = createM3FromDirectory(folder_name);
    for (file <- files(model)) {
        file_substance = readFile(file);
        length_files += countNewlines(file_substance);
    }
    return length_files;
}

// CC Risk evaluation Cyclomatic complexity per unit
// 1-10 simple, without much risk
// 11-20 more complex, moderate risk
// 21-50 complex, high risk
// > 50 untestable, very high risk

list[int] countComplexity(list[Declaration] asts, loc folder_name) {
    complexityList = [];
    M3 model = createM3FromDirectory(folder_name);
    methodNames = methods(model);
    for (methodName <- methodNames) {
        methodASTs = {d | /Declaration d := asts, d.decl == methodName};
        int numIf = 0;
        visit(methodASTs) {
            case \if(_, _): numIf += 1;
            case \if(_, _, _): numIf += 1;
        }
        complexityList += numIf;
        methodASTs = {};
        }
    return complexityList;
}

int main(int testArgument=0) {
    loc folder_name = |file:///C:/Users/Mikev/Downloads/smallsql0.21_src/smallsql0.21_src|;
    loc folder_name_testfiles = |file:///C:/SE_master/software_evolution/test_java_files/|;

    asts = getASTs(folder_name_testfiles);
    print(countComplexity(asts, folder_name_testfiles));
    return testArgument;
}
