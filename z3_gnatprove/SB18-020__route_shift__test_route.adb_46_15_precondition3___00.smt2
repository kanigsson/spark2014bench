(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-sort us_main_type 0)

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__test_route__route_acc__is_null_pointer Bool)(rec__test_route__route_acc__pointer_address Int)(rec__test_route__route_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__test_route__route_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__test_route__route_acc__is_null_pointer a))

(define-fun us_rep_rec__test_route__route_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__test_route__route_acc__pointer_address a))

(define-fun us_rep_rec__test_route__route_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__test_route__route_acc__pointer_value_abstr a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__test_route__route_acc__is_null_pointer a) 
                        (rec__test_route__route_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__test_route__route_acc__is_null_pointer a) true))
                        (and
                        (= (rec__test_route__route_acc__pointer_address a) 
                        (rec__test_route__route_acc__pointer_address b))
                        (= (rec__test_route__route_acc__pointer_value_abstr
                           a) (rec__test_route__route_acc__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes () ((t4b__ref (t4b__refqtmk (t4b__content us_rep)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_rep (t4b__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__test_route__point__x integer)(rec__test_route__point__y integer)))))
(define-fun us_split_fields_rec__test_route__point__x__projection ((a us_split_fields)) integer 
  (rec__test_route__point__x a))

(define-fun us_split_fields_rec__test_route__point__y__projection ((a us_split_fields)) integer 
  (rec__test_route__point__y a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__test_route__point__x (us_split_fields1 a))) 
                         (to_rep
                         (rec__test_route__point__x (us_split_fields1 b))))
                         (= (to_rep
                            (rec__test_route__point__y (us_split_fields1 a))) 
                         (to_rep
                         (rec__test_route__point__y (us_split_fields1 b)))))
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

(declare-const test_route__point__x__first__bit Int)

(declare-const test_route__point__x__last__bit Int)

(declare-const test_route__point__x__position Int)

;; test_route__point__x__first__bit_axiom
  (assert (<= 0 test_route__point__x__first__bit))

;; test_route__point__x__last__bit_axiom
  (assert
  (< test_route__point__x__first__bit test_route__point__x__last__bit))

;; test_route__point__x__position_axiom
  (assert (<= 0 test_route__point__x__position))

(declare-const test_route__point__y__first__bit Int)

(declare-const test_route__point__y__last__bit Int)

(declare-const test_route__point__y__position Int)

;; test_route__point__y__first__bit_axiom
  (assert (<= 0 test_route__point__y__first__bit))

;; test_route__point__y__last__bit_axiom
  (assert
  (< test_route__point__y__first__bit test_route__point__y__last__bit))

;; test_route__point__y__position_axiom
  (assert (<= 0 test_route__point__y__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ()
((point__ref (point__refqtmk (point__content us_rep1)))))
(define-fun point__ref_point__content__projection ((a point__ref)) us_rep1 
  (point__content a))

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (rec__test_route__point_acc__is_null_pointer Bool)(rec__test_route__point_acc__pointer_address Int)(rec__test_route__point_acc__pointer_value us_rep1)))))
(define-fun us_rep_rec__test_route__point_acc__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__test_route__point_acc__is_null_pointer a))

(define-fun us_rep_rec__test_route__point_acc__pointer_address__projection ((a us_rep2)) Int 
  (rec__test_route__point_acc__pointer_address a))

(define-fun us_rep_rec__test_route__point_acc__pointer_value__projection ((a us_rep2)) us_rep1 
  (rec__test_route__point_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref1 (us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__test_route__point_acc__is_null_pointer a) 
                         (rec__test_route__point_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__test_route__point_acc__is_null_pointer a) true))
                         (and
                         (= (rec__test_route__point_acc__pointer_address a) 
                         (rec__test_route__point_acc__pointer_address b))
                         (= (rec__test_route__point_acc__pointer_value a) 
                         (rec__test_route__point_acc__pointer_value b)))))
                    true false))

(define-fun rec__test_route__point_acc__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__test_route__point_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_route__point_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy4 us_rep2)

(declare-datatypes ()
((point_acc__ref (point_acc__refqtmk (point_acc__content us_rep2)))))
(define-fun point_acc__ref_point_acc__content__projection ((a point_acc__ref)) us_rep2 
  (point_acc__content a))

(declare-const dummy5 us_rep)

(declare-datatypes ()
((route_acc__ref (route_acc__refqtmk (route_acc__content us_rep)))))
(define-fun route_acc__ref_route_acc__content__projection ((a route_acc__ref)) us_rep 
  (route_acc__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__test_route__route__current us_rep2)(rec__test_route__route__rest us_rep)))))
(define-fun us_split_fields_rec__test_route__route__current__projection ((a us_split_fields2)) us_rep2 
  (rec__test_route__route__current a))

(define-fun us_split_fields_rec__test_route__route__rest__projection ((a us_split_fields2)) us_rep 
  (rec__test_route__route__rest a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep3 (us_repqtmk3 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep3)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (bool_eq2
                            (rec__test_route__route__current
                            (us_split_fields3 a))
                            (rec__test_route__route__current
                            (us_split_fields3 b))) true)
                         (= (bool_eq
                            (rec__test_route__route__rest
                            (us_split_fields3 a))
                            (rec__test_route__route__rest
                            (us_split_fields3 b))) true))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_route__route__current__first__bit Int)

(declare-const test_route__route__current__last__bit Int)

(declare-const test_route__route__current__position Int)

;; test_route__route__current__first__bit_axiom
  (assert (<= 0 test_route__route__current__first__bit))

;; test_route__route__current__last__bit_axiom
  (assert
  (< test_route__route__current__first__bit test_route__route__current__last__bit))

;; test_route__route__current__position_axiom
  (assert (<= 0 test_route__route__current__position))

(declare-const test_route__route__rest__first__bit Int)

(declare-const test_route__route__rest__last__bit Int)

(declare-const test_route__route__rest__position Int)

;; test_route__route__rest__first__bit_axiom
  (assert (<= 0 test_route__route__rest__first__bit))

;; test_route__route__rest__last__bit_axiom
  (assert
  (< test_route__route__rest__first__bit test_route__route__rest__last__bit))

;; test_route__route__rest__position_axiom
  (assert (<= 0 test_route__route__rest__position))

(declare-fun user_eq3 (us_rep3 us_rep3) Bool)

(declare-const dummy6 us_rep3)

(declare-datatypes ()
((route__ref (route__refqtmk (route__content us_rep3)))))
(define-fun route__ref_route__content__projection ((a route__ref)) us_rep3 
  (route__content a))

(declare-fun us_open (us_main_type) us_rep3)

(declare-fun us_close (us_rep3) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep3))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__test_route__route_acc__pointer_value ((a us_rep)) us_rep3 
  (us_open (rec__test_route__route_acc__pointer_value_abstr a)))

(define-fun rec__test_route__route_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__test_route__route_acc__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_route__route_acc__is_null_pointer us_null_pointer1) true))

(declare-fun temp___dynamic_invariant_222 (us_rep Bool Bool Bool Bool) Bool)

(define-fun dynamic_invariant1 ((temp___expr_221 us_rep)
  (temp___is_init_217 Bool) (temp___skip_constant_218 Bool)
  (temp___do_toplevel_219 Bool)
  (temp___do_typ_inv_220 Bool)) Bool (=>
                                     (not
                                     (= (rec__test_route__route_acc__is_null_pointer
                                        temp___expr_221) true))
                                     (and
                                     (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        (rec__test_route__route__current
                                        (us_split_fields3
                                        (rec__test_route__route_acc__pointer_value
                                        temp___expr_221)))) true))
                                     (temp___dynamic_invariant_222
                                     (rec__test_route__route__rest
                                     (us_split_fields3
                                     (rec__test_route__route_acc__pointer_value
                                     temp___expr_221))) true false true
                                     temp___do_typ_inv_220))))

;; def_axiom
  (assert
  (forall ((temp___expr_227 us_rep))
  (forall ((temp___is_init_223 Bool) (temp___skip_constant_224 Bool)
  (temp___do_toplevel_225 Bool) (temp___do_typ_inv_226 Bool))
  (! (= (temp___dynamic_invariant_222 temp___expr_227 temp___is_init_223
     temp___skip_constant_224 temp___do_toplevel_225 temp___do_typ_inv_226)
     (=>
     (not
     (= (rec__test_route__route_acc__is_null_pointer temp___expr_227) true))
     (and
     (not
     (= (rec__test_route__point_acc__is_null_pointer
        (rec__test_route__route__current
        (us_split_fields3
        (rec__test_route__route_acc__pointer_value temp___expr_227)))) true))
     (temp___dynamic_invariant_222
     (rec__test_route__route__rest
     (us_split_fields3
     (rec__test_route__route_acc__pointer_value temp___expr_227))) true false
     true temp___do_typ_inv_226)))) :pattern ((temp___dynamic_invariant_222
  temp___expr_227 temp___is_init_223 temp___skip_constant_224
  temp___do_toplevel_225 temp___do_typ_inv_226)) ))))

(define-fun default_initial_assumption ((temp___expr_228 us_rep)
  (temp___skip_top_level_229 Bool)) Bool (= (rec__test_route__route_acc__is_null_pointer
                                            temp___expr_228) true))

(define-fun dynamic_invariant2 ((temp___expr_234 us_rep3)
  (temp___is_init_230 Bool) (temp___skip_constant_231 Bool)
  (temp___do_toplevel_232 Bool)
  (temp___do_typ_inv_233 Bool)) Bool (and
                                     (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        (rec__test_route__route__current
                                        (us_split_fields3 temp___expr_234))) true))
                                     (=>
                                     (not
                                     (= (rec__test_route__route_acc__is_null_pointer
                                        (rec__test_route__route__rest
                                        (us_split_fields3 temp___expr_234))) true))
                                     (and
                                     (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        (rec__test_route__route__current
                                        (us_split_fields3
                                        (rec__test_route__route_acc__pointer_value
                                        (rec__test_route__route__rest
                                        (us_split_fields3 temp___expr_234)))))) true))
                                     (temp___dynamic_invariant_222
                                     (rec__test_route__route__rest
                                     (us_split_fields3
                                     (rec__test_route__route_acc__pointer_value
                                     (rec__test_route__route__rest
                                     (us_split_fields3 temp___expr_234)))))
                                     true false true temp___do_typ_inv_233)))))

(define-fun default_initial_assumption1 ((temp___expr_235 us_rep3)
  (temp___skip_top_level_236 Bool)) Bool (and
                                         (= (rec__test_route__point_acc__is_null_pointer
                                            (rec__test_route__route__current
                                            (us_split_fields3
                                            temp___expr_235))) true)
                                         (= (rec__test_route__route_acc__is_null_pointer
                                            (rec__test_route__route__rest
                                            (us_split_fields3
                                            temp___expr_235))) true)))

;; length__def_axiom
  (assert
  (forall ((r us_rep))
  (! (=>
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r) true))
     (dynamic_invariant2 (rec__test_route__route_acc__pointer_value r) true
     false true true))
     (= (length r) (ite (= (bool_eq r us_null_pointer1) true) 0
                   (+ (min 2147483646
                      (length
                      (rec__test_route__route__rest
                      (us_split_fields3
                      (rec__test_route__route_acc__pointer_value r))))) 1)))) :pattern (
  (length r)) )))

(declare-const dummy7 us_rep)

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content us_rep)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_rep (t5b__content
                                                                    a))

(declare-fun nth_x (us_rep Int) Int)

(declare-fun nth_x__function_guard (Int us_rep Int) Bool)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (positive positive) Bool)

(declare-const dummy8 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

;; nth_x__def_axiom
  (assert
  (forall ((r us_rep))
  (forall ((n Int))
  (! (=>
     (and
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r) true))
     (dynamic_invariant2 (rec__test_route__route_acc__pointer_value r) true
     false true true)) (dynamic_invariant4 n true true true true))
     (= (nth_x r n) (ite (= n 1)
                    (to_rep
                    (rec__test_route__point__x
                    (us_split_fields1
                    (rec__test_route__point_acc__pointer_value
                    (rec__test_route__route__current
                    (us_split_fields3
                    (rec__test_route__route_acc__pointer_value r)))))))
                    (nth_x
                    (rec__test_route__route__rest
                    (us_split_fields3
                    (rec__test_route__route_acc__pointer_value r))) (- n 1))))) :pattern (
  (nth_x r n)) ))))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep4 0)

(declare-fun bool_eq4 (us_rep4 us_rep4) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq5 (us_rep4 us_rep4) Bool)

(declare-const dummy9 us_rep4)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep4)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep4 
  (sequence__content a))

(declare-fun length1 (us_rep4) Int)

(declare-fun length__function_guard1 (Int us_rep4) Bool)

(define-fun last ((container us_rep4)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep4) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (extended_index extended_index) Bool)

(declare-const dummy10 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant5 ((temp___expr_257 Int)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (or (= temp___is_init_253 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_257)))

(declare-fun get (us_rep4 Int) Int)

(declare-fun get__function_guard (Int us_rep4 Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (element_type element_type) Bool)

(declare-const dummy11 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant6 ((temp___expr_250 Int)
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool)
  (temp___do_typ_inv_249 Bool)) Bool (=>
                                     (or (= temp___is_init_246 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_250)))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq ((left us_rep4)
  (right us_rep4)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard (Bool us_rep4 us_rep4) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep4) (b us_rep4))
  (! (= (user_eq5 a b) (oeq a b)) :pattern ((user_eq5 a b)) )))

(define-fun default_initial_assumption2 ((temp___expr_265 us_rep4)
  (temp___skip_top_level_266 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_266 true))
                                         (= (length1 temp___expr_265) 0)))

;; get__post_axiom
  (assert
  (forall ((container us_rep4))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant5 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant6 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(define-fun ole ((left us_rep4)
  (right us_rep4)) Bool (and (<= (length1 left) (length1 right)) (ite 
                                                                 (forall
                                                                 ((n Int))
                                                                 (=>
                                                                 (and
                                                                 (<= 1 n)
                                                                 (<= n 
                                                                 (last left)))
                                                                 (= (get left
                                                                    n) 
                                                                 (get right
                                                                 n)))) true
                                                                 false)))

(declare-fun ole__function_guard (Bool us_rep4 us_rep4) Bool)

(declare-fun add (us_rep4 Int) us_rep4)

(declare-fun add__function_guard (us_rep4 us_rep4 Int) Bool)

;; add__post_axiom
  (assert
  (forall ((container us_rep4))
  (forall ((new_item Int))
  (! (=>
     (and (dynamic_invariant6 new_item true true true true)
     (and (< (length1 container) 2147483647) (< (last container) 2147483647)))
     (let ((result (add container new_item)))
     (and
     (and (= (length1 result) (+ (length1 container) 1))
     (= (get result (last result)) new_item))
     (= (ole container result) true)))) :pattern ((add container new_item)) ))))

(declare-const dummy12 us_rep)

(declare-datatypes () ((t65b__ref (t65b__refqtmk (t65b__content us_rep)))))
(define-fun t65b__ref_t65b__content__projection ((a t65b__ref)) us_rep 
  (t65b__content a))

(declare-const r us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq8 (us_rep4 us_rep4) Bool)

(declare-const dummy13 us_rep4)

(declare-datatypes ()
((int_seq__ref (int_seq__refqtmk (int_seq__content us_rep4)))))
(define-fun int_seq__ref_int_seq__content__projection ((a int_seq__ref)) us_rep4 
  (int_seq__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r70b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep4) (b us_rep4))
  (! (= (user_eq8 a b) (oeq a b)) :pattern ((user_eq8 a b)) )))

(define-fun default_initial_assumption3 ((temp___expr_280 us_rep4)
  (temp___skip_top_level_281 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_281 true))
                                         (= (length1 temp___expr_280) 0)))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (integer integer) Bool)

(declare-const dummy14 integer)

(declare-datatypes () ((t71b__ref (t71b__refqtmk (t71b__content integer)))))
(define-fun t71b__ref_t71b__content__projection ((a t71b__ref)) integer 
  (t71b__content a))

(define-fun dynamic_invariant7 ((temp___expr_214 us_rep2)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        temp___expr_214) true)))

(define-fun default_initial_assumption4 ((temp___expr_215 us_rep2)
  (temp___skip_top_level_216 Bool)) Bool (= (rec__test_route__point_acc__is_null_pointer
                                            temp___expr_215) true))

;; length__post_axiom
  (assert
  (forall ((r1 us_rep))
  (! (=>
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r1) true))
     (dynamic_invariant2 (rec__test_route__route_acc__pointer_value r1) true
     false true true)) (dynamic_invariant (length r1) true false true true)) :pattern (
  (length r1)) )))

;; nth_x__post_axiom
  (assert
  (forall ((r1 us_rep))
  (forall ((n Int))
  (! (=>
     (and
     (and
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r1) true))
     (dynamic_invariant2 (rec__test_route__route_acc__pointer_value r1) true
     false true true)) (dynamic_invariant4 n true true true true))
     (<= n (length r1))) (dynamic_invariant3 (nth_x r1 n) true false true
     true)) :pattern ((nth_x r1 n)) ))))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq10 (count_type count_type) Bool)

(declare-const dummy15 count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant8 ((temp___expr_272 Int)
  (temp___is_init_268 Bool) (temp___skip_constant_269 Bool)
  (temp___do_toplevel_270 Bool)
  (temp___do_typ_inv_271 Bool)) Bool (=>
                                     (or (= temp___is_init_268 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_272)))

;; length__post_axiom
  (assert
  (forall ((container us_rep4))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant8 result true false
     true true))) :pattern ((length1 container)) )))

;; r70b__def_axiom
  (assert (= r70b (length r)))

(declare-const a us_rep4)

;; Assume
  (assert
  (=> (not (= (rec__test_route__route_acc__is_null_pointer r) true))
  (dynamic_invariant2 (rec__test_route__route_acc__pointer_value r) true
  false true true)))

;; Assume
  (assert (default_initial_assumption3 a false))

;; Assume
  (assert true)

(define-fun o () us_rep r)

(define-fun test_route__all_x__L_1__R70b__assume () Int (length o))

;; H
  (assert (dynamic_invariant test_route__all_x__L_1__R70b__assume true false
  true true))

;; H
  (assert
  (= test_route__all_x__L_1__R70b__assume (ite (= (bool_eq o
                                                  us_null_pointer1) true)
                                          0
                                          (+ (min 2147483646
                                             (length
                                             (rec__test_route__route__rest
                                             (us_split_fields3
                                             (rec__test_route__route_acc__pointer_value
                                             o))))) 1))))

;; Assume
  (assert (= test_route__all_x__L_1__R70b__assume r70b))

;; Assume
  (assert (dynamic_invariant r70b true false true true))

(declare-const a1 us_rep4)

(declare-const n Int)

;; H
  (assert (= n 1))

;; H
  (assert
  (let ((temp___297 r70b))
  (ite (= (and (ite (<= 1 n) true false) (ite (<= n temp___297) true false)) true)
  (let ((o1 (last a)))
  (and
  (and (dynamic_invariant5 o1 true false true true) (= o1 (+ 0 (length1 a))))
  (exists ((a2 us_rep4) (n1 Int))
  (and
  (and (= (last a2) (- n1 1))
  (forall ((i Int))
  (=> (and (<= 1 i) (<= i (- n1 1))) (= (get a2 i) (nth_x r i)))))
  (and
  (= (and (ite (dynamic_property 1 r70b n1) true false) (ite (and (<= 1 n1)
                                                             (<= n1 r70b))
                                                        true false)) true)
  (let ((o2 r))
  (let ((o3 (nth_x o2 n1)))
  (and
  (and (dynamic_invariant3 o3 true false true true)
  (= o3 (ite (= n1 1)
        (to_rep
        (rec__test_route__point__x
        (us_split_fields1
        (rec__test_route__point_acc__pointer_value
        (rec__test_route__route__current
        (us_split_fields3 (rec__test_route__route_acc__pointer_value o2)))))))
        (nth_x
        (rec__test_route__route__rest
        (us_split_fields3 (rec__test_route__route_acc__pointer_value o2)))
        (- n1 1)))))
  (let ((o4 (add a2 o3)))
  (and
  (and (and (= (length1 o4) (+ (length1 a2) 1)) (= (get o4 (last o4)) o3))
  (= (ole a2 o4) true)) (and (= a1 o4) (= n1 temp___297)))))))))))) (= 
  a1 a))))

(declare-const test_route__all_x__result us_rep4)

;; H
  (assert (= test_route__all_x__result a1))

(declare-const usf Int)

(define-fun o1 () us_rep r)

(define-fun o2 () Int (length o1))

;; H
  (assert (dynamic_invariant o2 true false true true))

;; H
  (assert
  (= o2 (ite (= (bool_eq o1 us_null_pointer1) true) 0
        (+ (min 2147483646
           (length
           (rec__test_route__route__rest
           (us_split_fields3 (rec__test_route__route_acc__pointer_value o1))))) 1))))

;; H
  (assert
  (= (and (ite (<= 1 usf) true false) (ite (<= usf o2) true false)) true))

(define-fun o3 () us_rep r)

(define-fun o4 () Int (nth_x o3 usf))

;; H
  (assert (dynamic_invariant3 o4 true false true true))

;; H
  (assert
  (= o4 (ite (= usf 1)
        (to_rep
        (rec__test_route__point__x
        (us_split_fields1
        (rec__test_route__point_acc__pointer_value
        (rec__test_route__route__current
        (us_split_fields3 (rec__test_route__route_acc__pointer_value o3)))))))
        (nth_x
        (rec__test_route__route__rest
        (us_split_fields3 (rec__test_route__route_acc__pointer_value o3)))
        (- usf 1)))))

(assert
;; defqtvc
 ;; File "test_route.adb", line 43, characters 0-0
  (not (<= 1 usf)))
(check-sat)
