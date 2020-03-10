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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__test_goto_borrow__list__is_null_pointer Bool)(rec__test_goto_borrow__list__pointer_address Int)(rec__test_goto_borrow__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__test_goto_borrow__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__test_goto_borrow__list__is_null_pointer a))

(define-fun us_rep_rec__test_goto_borrow__list__pointer_address__projection ((a us_rep)) Int 
  (rec__test_goto_borrow__list__pointer_address a))

(define-fun us_rep_rec__test_goto_borrow__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__test_goto_borrow__list__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__test_goto_borrow__list__is_null_pointer a) 
                        (rec__test_goto_borrow__list__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__test_goto_borrow__list__is_null_pointer a) true))
                        (and
                        (= (rec__test_goto_borrow__list__pointer_address a) 
                        (rec__test_goto_borrow__list__pointer_address b))
                        (= (rec__test_goto_borrow__list__pointer_value_abstr
                           a) (rec__test_goto_borrow__list__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy2 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy3 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-const dummy4 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__test_goto_borrow__list_cell__data integer)(rec__test_goto_borrow__list_cell__next us_rep)))))
(define-fun us_split_fields_rec__test_goto_borrow__list_cell__data__projection ((a us_split_fields)) integer 
  (rec__test_goto_borrow__list_cell__data a))

(define-fun us_split_fields_rec__test_goto_borrow__list_cell__next__projection ((a us_split_fields)) us_rep 
  (rec__test_goto_borrow__list_cell__next a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__test_goto_borrow__list_cell__data
                            (us_split_fields1 a))) (to_rep
                                                   (rec__test_goto_borrow__list_cell__data
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__test_goto_borrow__list_cell__next
                            (us_split_fields1 a))
                            (rec__test_goto_borrow__list_cell__next
                            (us_split_fields1 b))) true))
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

(declare-const test_goto_borrow__list_cell__data__first__bit Int)

(declare-const test_goto_borrow__list_cell__data__last__bit Int)

(declare-const test_goto_borrow__list_cell__data__position Int)

;; test_goto_borrow__list_cell__data__first__bit_axiom
  (assert (<= 0 test_goto_borrow__list_cell__data__first__bit))

;; test_goto_borrow__list_cell__data__last__bit_axiom
  (assert
  (< test_goto_borrow__list_cell__data__first__bit test_goto_borrow__list_cell__data__last__bit))

;; test_goto_borrow__list_cell__data__position_axiom
  (assert (<= 0 test_goto_borrow__list_cell__data__position))

(declare-const test_goto_borrow__list_cell__next__first__bit Int)

(declare-const test_goto_borrow__list_cell__next__last__bit Int)

(declare-const test_goto_borrow__list_cell__next__position Int)

;; test_goto_borrow__list_cell__next__first__bit_axiom
  (assert (<= 0 test_goto_borrow__list_cell__next__first__bit))

;; test_goto_borrow__list_cell__next__last__bit_axiom
  (assert
  (< test_goto_borrow__list_cell__next__first__bit test_goto_borrow__list_cell__next__last__bit))

;; test_goto_borrow__list_cell__next__position_axiom
  (assert (<= 0 test_goto_borrow__list_cell__next__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((list_cell__ref 0))
(((list_cell__refqtmk (list_cell__content us_rep1)))))
(define-fun list_cell__ref_list_cell__content__projection ((a list_cell__ref)) us_rep1 
  (list_cell__content a))

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__test_goto_borrow__list__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__test_goto_borrow__list__pointer_value_abstr a)))

(define-fun rec__test_goto_borrow__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__test_goto_borrow__list__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_goto_borrow__list__is_null_pointer us_null_pointer) true))

;; length__def_axiom
  (assert
  (forall ((l us_rep))
  (! (=> (length__function_guard (length l) l)
     (and
     (forall ((l1 us_rep)) (length__function_guard
     (length
     (rec__test_goto_borrow__list_cell__next
     (us_split_fields1 (rec__test_goto_borrow__list__pointer_value l1))))
     (rec__test_goto_borrow__list_cell__next
     (us_split_fields1 (rec__test_goto_borrow__list__pointer_value l1)))))
     (= (length l) (ite (= (bool_eq l us_null_pointer) true) 0
                   (+ (min 2147483646
                      (length
                      (rec__test_goto_borrow__list_cell__next
                      (us_split_fields1
                      (rec__test_goto_borrow__list__pointer_value l))))) 1))))) :pattern (
  (length l)) )))

(declare-const dummy6 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-const l us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun nth (us_rep Int) Int)

(declare-fun nth__function_guard (Int us_rep Int) Bool)

;; nth__def_axiom
  (assert
  (forall ((l1 us_rep))
  (forall ((n1 Int))
  (! (=>
     (and (dynamic_invariant n1 true true true true) (nth__function_guard
     (nth l1 n1) l1 n1))
     (and
     (forall ((l2 us_rep) (n2 Int)) (nth__function_guard
     (nth
     (rec__test_goto_borrow__list_cell__next
     (us_split_fields1 (rec__test_goto_borrow__list__pointer_value l2)))
     (- n2 1))
     (rec__test_goto_borrow__list_cell__next
     (us_split_fields1 (rec__test_goto_borrow__list__pointer_value l2)))
     (- n2 1)))
     (= (nth l1 n1) (ite (= n1 1)
                    (to_rep
                    (rec__test_goto_borrow__list_cell__data
                    (us_split_fields1
                    (rec__test_goto_borrow__list__pointer_value l1))))
                    (nth
                    (rec__test_goto_borrow__list_cell__next
                    (us_split_fields1
                    (rec__test_goto_borrow__list__pointer_value l1)))
                    (- n1 1)))))) :pattern ((nth l1 n1)) ))))

(define-fun default_initial_assumption ((temp___expr_183 us_rep)
  (temp___skip_top_level_184 Bool)) Bool (= (rec__test_goto_borrow__list__is_null_pointer
                                            temp___expr_183) true))

(define-fun default_initial_assumption1 ((temp___expr_190 us_rep1)
  (temp___skip_top_level_191 Bool)) Bool (= (rec__test_goto_borrow__list__is_null_pointer
                                            (rec__test_goto_borrow__list_cell__next
                                            (us_split_fields1
                                            temp___expr_190))) true))

;; length__post_axiom
  (assert
  (forall ((l1 us_rep))
  (! (let ((result (length l1)))
     (=> (length__function_guard result l1) (dynamic_invariant1 result true
     false true true))) :pattern ((length l1)) )))

(assert
;; defqtvc
 ;; File "test_goto_borrow.adb", line 14, characters 0-0
  (not
  (=> (dynamic_invariant n true false true true)
  (=> (length__function_guard (length l) l)
  (=> (<= n (length l)) (=> (not (= n 1)) (in_range1 (- n 1))))))))
(check-sat)
(exit)
