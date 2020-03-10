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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__predicate_ints__int__min integer)(rec__predicate_ints__int__max integer)(rec__predicate_ints__int__value integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__predicate_ints__int__min__projection ((a us_split_fields)) integer 
  (rec__predicate_ints__int__min a))

(define-fun us_split_fields_rec__predicate_ints__int__max__projection ((a us_split_fields)) integer 
  (rec__predicate_ints__int__max a))

(define-fun us_split_fields_rec__predicate_ints__int__value__projection ((a us_split_fields)) integer 
  (rec__predicate_ints__int__value a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__predicate_ints__int__min
                           (us_split_fields1 a))) (to_rep
                                                  (rec__predicate_ints__int__min
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__predicate_ints__int__max
                           (us_split_fields1 a))) (to_rep
                                                  (rec__predicate_ints__int__max
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__predicate_ints__int__value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__predicate_ints__int__value
                                                  (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const predicate_ints__int__min__first__bit Int)

(declare-const predicate_ints__int__min__last__bit Int)

(declare-const predicate_ints__int__min__position Int)

;; predicate_ints__int__min__first__bit_axiom
  (assert (<= 0 predicate_ints__int__min__first__bit))

;; predicate_ints__int__min__last__bit_axiom
  (assert
  (< predicate_ints__int__min__first__bit predicate_ints__int__min__last__bit))

;; predicate_ints__int__min__position_axiom
  (assert (<= 0 predicate_ints__int__min__position))

(declare-const predicate_ints__int__max__first__bit Int)

(declare-const predicate_ints__int__max__last__bit Int)

(declare-const predicate_ints__int__max__position Int)

;; predicate_ints__int__max__first__bit_axiom
  (assert (<= 0 predicate_ints__int__max__first__bit))

;; predicate_ints__int__max__last__bit_axiom
  (assert
  (< predicate_ints__int__max__first__bit predicate_ints__int__max__last__bit))

;; predicate_ints__int__max__position_axiom
  (assert (<= 0 predicate_ints__int__max__position))

(declare-const predicate_ints__int__value__first__bit Int)

(declare-const predicate_ints__int__value__last__bit Int)

(declare-const predicate_ints__int__value__position Int)

;; predicate_ints__int__value__first__bit_axiom
  (assert (<= 0 predicate_ints__int__value__first__bit))

;; predicate_ints__int__value__last__bit_axiom
  (assert
  (< predicate_ints__int__value__first__bit predicate_ints__int__value__last__bit))

;; predicate_ints__int__value__position_axiom
  (assert (<= 0 predicate_ints__int__value__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((int____ref 0))
(((int____refqtmk (int____content us_rep)))))
(define-fun int____ref_int____content__projection ((a int____ref)) us_rep 
  (int____content a))

(define-fun default_initial_assumption ((temp___expr_167 us_rep)
  (temp___skip_top_level_168 Bool)) Bool (= (attr__tag temp___expr_167) 
  us_tag))

(declare-fun oadd (us_rep us_rep) us_rep)

(declare-fun oadd__function_guard (us_rep us_rep us_rep) Bool)

(declare-fun oadd1 (Int us_rep us_rep) us_rep)

(declare-fun oadd__function_guard1 (us_rep Int us_rep us_rep) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__predicate_ints__approx_int__precision natural)(rec__predicate_ints__int__min1 integer)(rec__predicate_ints__int__max1 integer)(rec__predicate_ints__int__value1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__predicate_ints__approx_int__precision__projection ((a us_split_fields2)) natural 
  (rec__predicate_ints__approx_int__precision a))

(define-fun us_split_fields_rec__predicate_ints__int__min__2__projection ((a us_split_fields2)) integer 
  (rec__predicate_ints__int__min1 a))

(define-fun us_split_fields_rec__predicate_ints__int__max__2__projection ((a us_split_fields2)) integer 
  (rec__predicate_ints__int__max1 a))

(define-fun us_split_fields_rec__predicate_ints__int__value__2__projection ((a us_split_fields2)) integer 
  (rec__predicate_ints__int__value1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (natural us_private) us_private)

(declare-fun extract__predicate_ints__approx_int__precision (us_private) natural)

;; extract__predicate_ints__approx_int__precision__conv
  (assert
  (forall ((predicate_ints__approx_int__precision natural))
  (forall ((rec__ext__2 us_private))
  (= (extract__predicate_ints__approx_int__precision
     (hide_ext__ predicate_ints__approx_int__precision rec__ext__2)) predicate_ints__approx_int__precision))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__predicate_ints__int__min1
                                         (us_split_fields3 a))
                                         (rec__predicate_ints__int__max1
                                         (us_split_fields3 a))
                                         (rec__predicate_ints__int__value1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__predicate_ints__approx_int__precision
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__predicate_ints__approx_int__precision
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__predicate_ints__int__min
                                         (us_split_fields1 r))
                                         (rec__predicate_ints__int__max
                                         (us_split_fields1 r))
                                         (rec__predicate_ints__int__value
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep1
                            (rec__predicate_ints__approx_int__precision
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__predicate_ints__approx_int__precision
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__predicate_ints__int__min1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__predicate_ints__int__min1
                                                   (us_split_fields3 b)))))
                         (and
                         (= (to_rep
                            (rec__predicate_ints__int__max1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__predicate_ints__int__max1
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__predicate_ints__int__value1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__predicate_ints__int__value1
                                                   (us_split_fields3 b))))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const predicate_ints__approx_int__precision__first__bit Int)

(declare-const predicate_ints__approx_int__precision__last__bit Int)

(declare-const predicate_ints__approx_int__precision__position Int)

;; predicate_ints__approx_int__precision__first__bit_axiom
  (assert (<= 0 predicate_ints__approx_int__precision__first__bit))

;; predicate_ints__approx_int__precision__last__bit_axiom
  (assert
  (< predicate_ints__approx_int__precision__first__bit predicate_ints__approx_int__precision__last__bit))

;; predicate_ints__approx_int__precision__position_axiom
  (assert (<= 0 predicate_ints__approx_int__precision__position))

(declare-const predicate_ints__int__min__first__bit1 Int)

(declare-const predicate_ints__int__min__last__bit1 Int)

(declare-const predicate_ints__int__min__position1 Int)

;; predicate_ints__int__min__first__bit_axiom
  (assert (<= 0 predicate_ints__int__min__first__bit1))

;; predicate_ints__int__min__last__bit_axiom
  (assert
  (< predicate_ints__int__min__first__bit1 predicate_ints__int__min__last__bit1))

;; predicate_ints__int__min__position_axiom
  (assert (<= 0 predicate_ints__int__min__position1))

(declare-const predicate_ints__int__max__first__bit1 Int)

(declare-const predicate_ints__int__max__last__bit1 Int)

(declare-const predicate_ints__int__max__position1 Int)

;; predicate_ints__int__max__first__bit_axiom
  (assert (<= 0 predicate_ints__int__max__first__bit1))

;; predicate_ints__int__max__last__bit_axiom
  (assert
  (< predicate_ints__int__max__first__bit1 predicate_ints__int__max__last__bit1))

;; predicate_ints__int__max__position_axiom
  (assert (<= 0 predicate_ints__int__max__position1))

(declare-const predicate_ints__int__value__first__bit1 Int)

(declare-const predicate_ints__int__value__last__bit1 Int)

(declare-const predicate_ints__int__value__position1 Int)

;; predicate_ints__int__value__first__bit_axiom
  (assert (<= 0 predicate_ints__int__value__first__bit1))

;; predicate_ints__int__value__last__bit_axiom
  (assert
  (< predicate_ints__int__value__first__bit1 predicate_ints__int__value__last__bit1))

;; predicate_ints__int__value__position_axiom
  (assert (<= 0 predicate_ints__int__value__position1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((approx_int__ref 0))
(((approx_int__refqtmk (approx_int__content us_rep1)))))
(define-fun approx_int__ref_approx_int__content__projection ((a approx_int__ref)) us_rep1 
  (approx_int__content a))

(declare-fun oadd2 (us_rep1 us_rep1) us_rep1)

(declare-fun oadd__function_guard2 (us_rep1 us_rep1 us_rep1) Bool)

(declare-fun oadd3 (Int us_rep1 us_rep1) us_rep1)

(declare-fun oadd__function_guard3 (us_rep1 Int us_rep1 us_rep1) Bool)

;; oadd__post_axiom
  (assert
  (forall ((arg1 us_rep) (arg2 us_rep))
  (! (=>
     (and
     (= (to_rep (rec__predicate_ints__int__min (us_split_fields1 arg1))) 
     (to_rep (rec__predicate_ints__int__min (us_split_fields1 arg2))))
     (= (to_rep (rec__predicate_ints__int__max (us_split_fields1 arg1))) 
     (to_rep (rec__predicate_ints__int__max (us_split_fields1 arg2)))))
     (let ((result (oadd arg1 arg2)))
     (=> (oadd__function_guard result arg1 arg2)
     (= (attr__tag result) us_tag)))) :pattern ((oadd arg1 arg2)) )))

;; oadd__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((arg1 us_rep) (arg2 us_rep))
  (! (=>
     (and
     (= (to_rep (rec__predicate_ints__int__min (us_split_fields1 arg1))) 
     (to_rep (rec__predicate_ints__int__min (us_split_fields1 arg2))))
     (= (to_rep (rec__predicate_ints__int__max (us_split_fields1 arg1))) 
     (to_rep (rec__predicate_ints__int__max (us_split_fields1 arg2)))))
     (let ((result (oadd1 attr__tag2 arg1 arg2)))
     (=> (oadd__function_guard1 result attr__tag2 arg1 arg2)
     (= (attr__tag result) attr__tag2)))) :pattern ((oadd1 attr__tag2 arg1
                                                    arg2)) ))))

;; predicate_ints__int__compat_axiom
  (assert
  (forall ((arg1 us_rep) (arg2 us_rep))
  (! (=> (oadd__function_guard1 (oadd1 us_tag arg1 arg2) us_tag arg1 arg2)
     (and
     (forall ((arg11 us_rep) (arg21 us_rep)) (oadd__function_guard
     (oadd arg11 arg21) arg11 arg21))
     (= (oadd arg1 arg2) (oadd1 us_tag arg1 arg2)))) :pattern ((oadd1 
                                                               us_tag arg1
                                                               arg2)) )))

;; predicate_ints__approx_int__compat_axiom
  (assert
  (forall ((arg1 us_rep) (arg2 us_rep))
  (! (=> (oadd__function_guard1 (oadd1 us_tag1 arg1 arg2) us_tag1 arg1 arg2)
     (and
     (forall ((arg11 us_rep) (arg21 us_rep)) (oadd__function_guard2
     (oadd2 (of_base arg11) (of_base arg21)) (of_base arg11)
     (of_base arg21)))
     (= (to_base (oadd2 (of_base arg1) (of_base arg2))) (oadd1 us_tag1 arg1
                                                        arg2)))) :pattern (
  (oadd1 us_tag1 arg1 arg2)) )))

(define-fun default_initial_assumption1 ((temp___expr_196 us_rep1)
  (temp___skip_top_level_197 Bool)) Bool (= (attr__tag1 temp___expr_196) 
  us_tag1))

(declare-const arg1 us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const arg2 us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; oadd__post_axiom
  (assert
  (forall ((arg11 us_rep1) (arg21 us_rep1))
  (! (=>
     (and
     (= (to_rep (rec__predicate_ints__int__min1 (us_split_fields3 arg11))) 
     (to_rep (rec__predicate_ints__int__min1 (us_split_fields3 arg21))))
     (= (to_rep (rec__predicate_ints__int__max1 (us_split_fields3 arg11))) 
     (to_rep (rec__predicate_ints__int__max1 (us_split_fields3 arg21)))))
     (let ((result (oadd2 arg11 arg21)))
     (=> (oadd__function_guard2 result arg11 arg21)
     (= (attr__tag1 result) us_tag1)))) :pattern ((oadd2 arg11 arg21)) )))

;; oadd__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((arg11 us_rep1) (arg21 us_rep1))
  (! (=>
     (and
     (= (to_rep (rec__predicate_ints__int__min1 (us_split_fields3 arg11))) 
     (to_rep (rec__predicate_ints__int__min1 (us_split_fields3 arg21))))
     (= (to_rep (rec__predicate_ints__int__max1 (us_split_fields3 arg11))) 
     (to_rep (rec__predicate_ints__int__max1 (us_split_fields3 arg21)))))
     (let ((result (oadd3 attr__tag2 arg11 arg21)))
     (=> (oadd__function_guard3 result attr__tag2 arg11 arg21)
     (= (attr__tag1 result) attr__tag2)))) :pattern ((oadd3 attr__tag2 arg11
                                                     arg21)) ))))

;; predicate_ints__approx_int__compat_axiom
  (assert
  (forall ((arg11 us_rep1) (arg21 us_rep1))
  (! (=> (oadd__function_guard3 (oadd3 us_tag1 arg11 arg21) us_tag1 arg11
     arg21)
     (and
     (forall ((arg12 us_rep1) (arg22 us_rep1)) (oadd__function_guard2
     (oadd2 arg12 arg22) arg12 arg22))
     (= (oadd2 arg11 arg21) (oadd3 us_tag1 arg11 arg21)))) :pattern (
  (oadd3 us_tag1 arg11 arg21)) )))

(assert
;; defqtvc
 ;; File "predicate_ints.ads", line 33, characters 0-0
  (not
  (=>
  (= (to_rep (rec__predicate_ints__int__min1 (us_split_fields3 arg1))) 
  (to_rep (rec__predicate_ints__int__min1 (us_split_fields3 arg2))))
  (=>
  (= (to_rep (rec__predicate_ints__int__max1 (us_split_fields3 arg1))) 
  (to_rep (rec__predicate_ints__int__max1 (us_split_fields3 arg2))))
  (let ((o (to_base arg2)))
  (let ((o1 (to_base arg1)))
  (=> (oadd__function_guard (oadd o1 o) o1 o)
  (forall ((o2 Int))
  (=>
  (= (to_rep1
     (rec__predicate_ints__approx_int__precision (us_split_fields3 arg2))) o2)
  (forall ((o3 Int))
  (=>
  (= (to_rep1
     (rec__predicate_ints__approx_int__precision (us_split_fields3 arg1))) o3)
  (in_range1 (max o3 o2)))))))))))))
(check-sat)
(exit)
