Testcase.create(:name => "initial_variable.java", :java => "// The reducer shoudl be commutative because \'index\'\n// is always larger than 0;\n// However, J-ReCoVer would not know the initial value\n// during the part of not entering beforeLoop\n\npublic void reduce(Text prefix, Iterator<IntWritable> iter,\n        OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {\n    int sumA = 0;\n    int sumB = 0;\n    int index = 5;\n\n    while(iter.hasNext()) {\n        int cur = iter.next().get();\n        if (index > 0) sumA += cur;\n        else sumB += cur;\n        index += 1;\n    }\n\n    output.collect(prefix, new IntWritable(sumA > sumB ? sumA : sumB));\n}\n\n", :t1 => "Text", :t2 => "IntWritable", :t3 => "Text", :t4 => "IntWritable", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 3, :result => "Unknown.")
Testcase.create(:name => "max_even_odd.java", :java => "// Sum up the odd and even numbers in the list\n// Return the bigger one\n// Not commutable\n\npublic void reduce(Text prefix, Iterator<IntWritable> iter,\n        OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {\n    int sumEven = 0;\n    int sumOdd = 0;\n    int index = 0;\n\n    while(iter.hasNext()) {\n        int cur = iter.next().get();\n        if (index % 2 == 0) sumEven += cur;\n        else sumOdd += cur;\n        index += 1;\n    }\n\n    output.collect(prefix, new IntWritable(sumEven > sumOdd ? sumEven : sumOdd));\n}\n\n", :t1 => "Text", :t2 => "IntWritable", :t3 => "Text", :t4 => "IntWritable", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 2, :result => "Not Commutative.")
Testcase.create(:name => "deep_branches.java", :java => "// A program with complicate condition branches\n// Just making it hard to determine commutativity in one sight\n\npublic void reduce(Text prefix, Iterator<IntWritable> iter,\n        OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {\n    int cur = iter.next().get();\n    int max = cur;\n    int min = cur;\n    int sum1 = 0;\n    int sum2 = 0;\n    while(iter.hasNext()) {\n        cur = iter.next().get();\n        max = cur > max ? cur : max;\n        min = cur < min ? cur : min;\n        if (max > 10) {\n            if (sum1 == 3) {\n                sum1 -= cur;\n                max += 1;\n                sum2 = min + max;\n            } else {\n                if (sum1 + min == 3) {\n                    sum2 += cur;\n                    max *= 3;\n                } else {\n                    min = 0;\n                    if (sum2++ > sum1) {\n                        sum1 = sum2 + max + min;\n                    }\n                }\n                min -= max;\n                sum2 -= 1;\n            }\n        } else {\n            if (sum1 == 3) {\n                sum1 -= cur;\n                sum2 += cur;\n            } else {\n                if (sum1 + min == 3) {\n                    max *= 3;\n                    sum2 = min + max;\n                    max += 1;\n                } else {\n                    min = 0;\n                    if (sum2++ > sum1) {\n                        sum1 = sum2 + max + min;\n                    }\n                }\n                min += max;\n                sum2 /= 2;\n            }\n        }\n    }\n    output.collect(prefix, new IntWritable(sum2));\n}\n\n", :t1 => "Text", :t2 => "IntWritable", :t3 => "Text", :t4 => "IntWritable", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 2, :result => "Not Commutative.")
Testcase.create(:name => "tricky_avg.java", :java => "// \n\npublic void reduce(Text key, Iterator<IntWritable> values, \n        OutputCollector<Text, DoubleWritable> output, Reporter reporter) throws IOException {\n    double avg = 0;\n    int sum1 = 0;\n    int count1 = 0;\n    int sum2 = 0;\n    int count2 = 0;\n    int sum3 = 0;\n    int count3 = 0;\n\n    while(values.hasNext()){\n        int cur = values.next().get();\n        if (cur < 10) {\n            sum1 += cur;\n            count1 += 1;\n        } else if (cur >= 20) {\n            sum3 += cur;\n            count3 += 1;\n        } else {\n            sum2 += cur;\n            count2 += 1;\n        }\n    }\n    avg = (sum1 + sum2 + sum3) / (count1 + count2 + count3);\n\n    output.collect(key, new DoubleWritable(avg));\n}\n", :t1 => "Text", :t2 => "IntWritable", :t3 => "Text", :t4 => "DoubleWritable", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 1, :result => "Commutative.")
Testcase.create(:name => "sum_even_odd.java", :java => "// Sum up the odd and even numbers seperately. Then add the sums.\n// Commutable\n\npublic void reduce(Text prefix, Iterator<IntWritable> iter,\n        OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {\n    int sumEven = 0;\n    int sumOdd = 0;\n    int index = 0;\n\n    while(iter.hasNext()) {\n        int cur = iter.next().get();\n        if (index % 2 == 0) sumEven += cur;\n        else sumOdd += cur;\n        index += 1;\n    }\n\n    output.collect(prefix, new IntWritable(sumEven + sumOdd));\n}\n\n", :t1 => "Text", :t2 => "IntWritable", :t3 => "Text", :t4 => "IntWritable", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 3, :result => "Unknown.")
Testcase.create(:name => "floating_point.java", :java => "// Inaccuracy of floating points\n\n\nprivate final double D = 0.85;\nprivate DoubleWritable result = new DoubleWritable();\n\npublic void reduce(Text key, Iterable<DoubleWritable> values, Context context)\n\t\tthrows IOException, InterruptedException {\n\n\tdouble sum = 1.0 - D;\n\tfor (DoubleWritable value : values) {\n\t\tsum += value.get();\n\t}\n\tresult.set(sum);\n\n\tcontext.write(result, key);\n}\n", :t1 => "Text", :t2 => "DoubleWritable", :t3 => "Text", :t4 => "DoubleWritable", :r_type => "Context", :source => "Self", :comment => "", :result_type => 3, :result => "Unknown.")
Testcase.create(:name => "tcp_waittime.java", :java => "// Idea comes from the TCP back up inverval\n\npublic void reduce(Text key, Iterator<IntWritable> values, \n        OutputCollector<Text, Integer> output, Reporter reporter) throws IOException {\n\n    int cur = values.next().get();\n    int maxEdge = cur * 2;\n\n    while(values.hasNext()){\n        int in = values.next().get();\n        if (cur + in > maxEdge) {\n            maxEdge = maxEdge * 2;\n            cur = 0;\n        } else {\n            cur += in;\n        }\n    }\n\n    output.collect(key, cur);\n}\n", :t1 => "Text", :t2 => "IntWritable", :t3 => "Text", :t4 => "Integer", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 2, :result => "Not Commutative.")
Testcase.create(:name => "inner_loop.java", :java => "// Nested loop\n// Loop is considered as an if-condition\n\nprivate long total;\nprivate long kept = 0;\nprivate float keep;\n\npublic void reduce(LongWritable key, Iterator<LongWritable> values,\n\t\tOutputCollector<LongWritable,LongWritable> output, Reporter reporter)\n\t\t\t\tthrows IOException {\n\twhile (values.hasNext()) {\n        ++total;\n        while((float) kept / total < keep) {\n            ++kept;\n            output.collect(key, values.next());\n        }\n\t}\n}\n", :t1 => "LongWritable", :t2 => "LongWritable", :t3 => "LongWritable", :t4 => "LongWritable", :r_type => "Collector", :source => "Self", :comment => "", :result_type => 3, :result => "Unknown.")
puts "Self-written benchmarks done"