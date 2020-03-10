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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p1__normal_record__x integer)))))
(define-fun us_split_fields_rec__p1__normal_record__x__projection ((a us_split_fields)) integer 
  (rec__p1__normal_record__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__p1__normal_record__x (us_split_fields1 a))) 
                   (to_rep (rec__p1__normal_record__x (us_split_fields1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p1__normal_record__x__first__bit Int)

(declare-const p1__normal_record__x__last__bit Int)

(declare-const p1__normal_record__x__position Int)

;; p1__normal_record__x__first__bit_axiom
  (assert (<= 0 p1__normal_record__x__first__bit))

;; p1__normal_record__x__last__bit_axiom
  (assert
  (< p1__normal_record__x__first__bit p1__normal_record__x__last__bit))

;; p1__normal_record__x__position_axiom
  (assert (<= 0 p1__normal_record__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((normal_record__ref 0))
(((normal_record__refqtmk (normal_record__content us_rep)))))
(define-fun normal_record__ref_normal_record__content__projection ((a normal_record__ref)) us_rep 
  (normal_record__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__p2__limited_record__x integer)))))
(define-fun us_split_fields_rec__p2__limited_record__x__projection ((a us_split_fields2)) integer 
  (rec__p2__limited_record__x a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p2__limited_record__x__first__bit Int)

(declare-const p2__limited_record__x__last__bit Int)

(declare-const p2__limited_record__x__position Int)

;; p2__limited_record__x__first__bit_axiom
  (assert (<= 0 p2__limited_record__x__first__bit))

;; p2__limited_record__x__last__bit_axiom
  (assert
  (< p2__limited_record__x__first__bit p2__limited_record__x__last__bit))

;; p2__limited_record__x__position_axiom
  (assert (<= 0 p2__limited_record__x__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((limited_record__ref 0))
(((limited_record__refqtmk (limited_record__content us_rep1)))))
(define-fun limited_record__ref_limited_record__content__projection ((a limited_record__ref)) us_rep1 
  (limited_record__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2 (rec__p3__limited_record_with_user_eq__x integer)))))
(define-fun us_split_fields_rec__p3__limited_record_with_user_eq__x__projection ((a us_split_fields4)) integer 
  (rec__p3__limited_record_with_user_eq__x a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p3__limited_record_with_user_eq__x__first__bit Int)

(declare-const p3__limited_record_with_user_eq__x__last__bit Int)

(declare-const p3__limited_record_with_user_eq__x__position Int)

;; p3__limited_record_with_user_eq__x__first__bit_axiom
  (assert (<= 0 p3__limited_record_with_user_eq__x__first__bit))

;; p3__limited_record_with_user_eq__x__last__bit_axiom
  (assert
  (< p3__limited_record_with_user_eq__x__first__bit p3__limited_record_with_user_eq__x__last__bit))

;; p3__limited_record_with_user_eq__x__position_axiom
  (assert (<= 0 p3__limited_record_with_user_eq__x__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((limited_record_with_user_eq__ref 0))
(((limited_record_with_user_eq__refqtmk
  (limited_record_with_user_eq__content us_rep2)))))
(define-fun limited_record_with_user_eq__ref_limited_record_with_user_eq__content__projection ((a limited_record_with_user_eq__ref)) us_rep2 
  (limited_record_with_user_eq__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun oeq (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (and
     (forall ((a1 us_rep2) (b1 us_rep2)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq3 a b) (oeq a b))) :pattern ((user_eq3 a b)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int us_rep1))))))
(declare-fun slide1 ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(declare-fun bool_eq2 ((Array Int us_rep1) Int Int (Array Int us_rep1) Int
  Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

;; oeq__post_axiom
  (assert true)

;; oeq__def_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (oeq left right) true)
     (= (to_rep
        (rec__p3__limited_record_with_user_eq__x (us_split_fields5 left))) 
     (to_rep
     (rec__p3__limited_record_with_user_eq__x (us_split_fields5 right))))) :pattern (
  (oeq left right)) )))

(declare-datatypes ((map__ref2 0))
(((map__refqtmk2 (map__content2 (Array Int us_rep2))))))
(declare-fun slide2 ((Array Int us_rep2) Int Int) (Array Int us_rep2))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep2)))
  (forall ((first Int))
  (! (= (slide2 a first first) a) :pattern ((slide2 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep2)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide2 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide2 a old_first new_first) i)) ))))))

(declare-fun bool_eq3 ((Array Int us_rep2) Int Int (Array Int us_rep2) Int
  Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun oeq1 ((Array Int us_rep2) (Array Int us_rep2)) Bool)

(declare-fun oeq__function_guard1 (Bool (Array Int us_rep2)
  (Array Int us_rep2)) Bool)

;; oeq__post_axiom
  (assert true)

;; oeq__def_axiom
  (assert
  (forall ((left (Array Int us_rep2)) (right (Array Int us_rep2)))
  (! (and
     (forall ((left1 (Array Int us_rep2)) (right1 (Array Int us_rep2))
     (x Int)) (oeq__function_guard (oeq (select left1 x) (select right1 x))
     (select left1 x) (select right1 x)))
     (= (= (oeq1 left right) true)
     (forall ((x Int))
     (=> (and (<= 1 x) (<= x 3))
     (= (oeq (select left x) (select right x)) true))))) :pattern ((oeq1 left
                                                                   right)) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 3))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq4 (index index) Bool)

(declare-const dummy4 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-sort index1 0)

(declare-fun indexqtint1 (index1) Int)

;; index'axiom
  (assert
  (forall ((i index1)) (and (<= 1 (indexqtint1 i)) (<= (indexqtint1 i) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (index1 index1) Bool)

(declare-const dummy5 index1)

(declare-datatypes ((index__ref1 0))
(((index__refqtmk1 (index__content1 index1)))))
(define-fun index__ref_index__content__2__projection ((a index__ref1)) index1 
  (index__content1 a))

(declare-sort index2 0)

(declare-fun indexqtint2 (index2) Int)

;; index'axiom
  (assert
  (forall ((i index2)) (and (<= 1 (indexqtint2 i)) (<= (indexqtint2 i) 3))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq6 (index2 index2) Bool)

(declare-const dummy6 index2)

(declare-datatypes ((index__ref2 0))
(((index__refqtmk2 (index__content2 index2)))))
(define-fun index__ref_index__content__3__projection ((a index__ref2)) index2 
  (index__content2 a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_209 Int)
  (temp___is_init_205 Bool) (temp___skip_constant_206 Bool)
  (temp___do_toplevel_207 Bool)
  (temp___do_typ_inv_208 Bool)) Bool (=>
                                     (or (= temp___is_init_205 true)
                                     (<= 1 3)) (in_range1 temp___expr_209)))

(define-fun dynamic_invariant2 ((temp___expr_227 Int)
  (temp___is_init_223 Bool) (temp___skip_constant_224 Bool)
  (temp___do_toplevel_225 Bool)
  (temp___do_typ_inv_226 Bool)) Bool (=>
                                     (or (= temp___is_init_223 true)
                                     (<= 1 3)) (in_range2 temp___expr_227)))

(define-fun dynamic_invariant3 ((temp___expr_245 Int)
  (temp___is_init_241 Bool) (temp___skip_constant_242 Bool)
  (temp___do_toplevel_243 Bool)
  (temp___do_typ_inv_244 Bool)) Bool (=>
                                     (or (= temp___is_init_241 true)
                                     (<= 1 3)) (in_range3 temp___expr_245)))

(assert
;; defqtvc
 ;; File "client.adb", line 8, characters 0-0
  (not
  (forall ((x__split_fields integer) (z__split_fields integer)
  (a (Array Int us_rep)))
  (=>
  (= (bool_eq (us_repqtmk (us_split_fieldsqtmk x__split_fields))
     (us_repqtmk (us_split_fieldsqtmk x__split_fields))) true)
  (=>
  (forall ((z__split_fields1 integer)) (oeq__function_guard
  (oeq (us_repqtmk2 (us_split_fieldsqtmk2 z__split_fields1))
  (us_repqtmk2 (us_split_fieldsqtmk2 z__split_fields1)))
  (us_repqtmk2 (us_split_fieldsqtmk2 z__split_fields1))
  (us_repqtmk2 (us_split_fieldsqtmk2 z__split_fields1))))
  (=>
  (= (oeq (us_repqtmk2 (us_split_fieldsqtmk2 z__split_fields))
     (us_repqtmk2 (us_split_fieldsqtmk2 z__split_fields))) true)
  (= (bool_eq1 a 1 3 a 1 3) true)))))))
(check-sat)
(exit)
