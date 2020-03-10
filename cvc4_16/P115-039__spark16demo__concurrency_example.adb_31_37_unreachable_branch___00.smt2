(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int integer))))))
(declare-fun slide1 ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const all_zeroes (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const all_ones (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq3 (us_rep us_rep) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((time__ref 0))
(((time__refqtmk (time__content us_rep)))))
(define-fun time__ref_time__content__projection ((a time__ref)) us_rep 
  (time__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq4 (us_rep1 us_rep1) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((time_span__ref 0))
(((time_span__refqtmk (time_span__content us_rep1)))))
(define-fun time_span__ref_time_span__content__projection ((a time_span__ref)) us_rep1 
  (time_span__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun milliseconds (Int) us_rep1)

(declare-fun milliseconds__function_guard (us_rep1 Int) Bool)

;; milliseconds__post_axiom
  (assert true)

(declare-fun oadd (us_rep us_rep1) us_rep)

(declare-fun oadd__function_guard (us_rep us_rep us_rep1) Bool)

;; oadd__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-sort tdata_tD1 0)

(declare-fun tdata_tD1qtint (tdata_tD1) Int)

;; tdata_tD1'axiom
  (assert
  (forall ((i tdata_tD1))
  (and (<= 1 (tdata_tD1qtint i)) (<= (tdata_tD1qtint i) 1000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (tdata_tD1 tdata_tD1) Bool)

(declare-const dummy6 tdata_tD1)

(declare-datatypes ((tdata_tD1__ref 0))
(((tdata_tD1__refqtmk (tdata_tD1__content tdata_tD1)))))
(define-fun tdata_tD1__ref_tdata_tD1__content__projection ((a tdata_tD1__ref)) tdata_tD1 
  (tdata_tD1__content a))

(declare-fun concurrency_example__all_zeroes__aggregate_def (Int) (Array Int integer))

(declare-fun concurrency_example__all_ones__aggregate_def (Int) (Array Int integer))

(declare-fun temp___String_Literal_242 (tuple0) (Array Int character))

;; temp___String_Literal_242__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 1)) 97)
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 2)) 108))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 3)) 108)
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 4)) 32))
     (and
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 5)) 122)
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 6)) 101)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 7)) 114)
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 8)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 9)) 101)
     (= (to_rep (select (temp___String_Literal_242 us_void_param) 10)) 115))))) :pattern (
  (temp___String_Literal_242 us_void_param)) )))

(declare-fun temp___String_Literal_243 (tuple0) (Array Int character))

;; temp___String_Literal_243__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 1)) 97)
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 2)) 108))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 3)) 108)
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 4)) 32))
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 5)) 111))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 6)) 110)
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 7)) 101))
     (= (to_rep (select (temp___String_Literal_243 us_void_param) 8)) 115)))) :pattern (
  (temp___String_Literal_243 us_void_param)) )))

(declare-fun temp___String_Literal_244 (tuple0) (Array Int character))

;; temp___String_Literal_244__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 1)) 100)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 2)) 97))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 3)) 116)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 4)) 97))
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 5)) 32)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 6)) 114)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 7)) 97)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 8)) 99))
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 9)) 101)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 10)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 11)) 100)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 12)) 101))
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 13)) 116)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 14)) 101)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 15)) 99)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 16)) 116))
     (and
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 17)) 101)
     (= (to_rep (select (temp___String_Literal_244 us_void_param) 18)) 100)))))) :pattern (
  (temp___String_Literal_244 us_void_param)) )))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

;; all_zeroes__def_axiom
  (assert (= all_zeroes (concurrency_example__all_zeroes__aggregate_def 0)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___156 Int))
  (=> (dynamic_invariant temp___156 true true true true)
  (forall ((temp___157 Int))
  (= (select (concurrency_example__all_zeroes__aggregate_def temp___156) temp___157) 
  rliteral)))))

;; all_ones__def_axiom
  (assert
  (= all_ones (concurrency_example__all_ones__aggregate_def (- 2147483648))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) (- 2147483648)))

;; def_axiom
  (assert
  (forall ((temp___159 Int))
  (=> (dynamic_invariant temp___159 true true true true)
  (forall ((temp___160 Int))
  (= (select (concurrency_example__all_ones__aggregate_def temp___159) temp___160) 
  rliteral1)))))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (count count) Bool)

(declare-const dummy7 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant4 ((temp___expr_214 Int)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (or (= temp___is_init_210 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_214)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant4
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant4
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

(assert
;; defqtvc
 ;; File "concurrency_example.ads", line 9, characters 0-0
  (not
  (forall ((data (Array Int integer)) (o us_rep) (deadline us_rep)
  (value (Array Int integer)))
  (=> (= (concurrency_example__all_zeroes__aggregate_def 0) all_zeroes)
  (=>
  (= (concurrency_example__all_ones__aggregate_def (- 2147483648)) all_ones)
  (=> (= value data)
  (=> (= deadline o)
  (=> (not (= (bool_eq2 value 1 1000 all_zeroes 1 1000) true))
  (= (bool_eq2 value 1 1000 all_ones 1 1000) true)))))))))
(check-sat)
(exit)
