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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

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

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-const dummy3 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

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

(declare-fun nth (us_rep Int) Int)

(declare-fun nth__function_guard (Int us_rep Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

;; nth__def_axiom
  (assert
  (forall ((l us_rep))
  (forall ((n Int))
  (! (=>
     (and (dynamic_invariant2 n true true true true) (nth__function_guard
     (nth l n) l n))
     (and
     (forall ((l1 us_rep) (n1 Int)) (nth__function_guard
     (nth
     (rec__test_goto_borrow__list_cell__next
     (us_split_fields1 (rec__test_goto_borrow__list__pointer_value l1)))
     (- n1 1))
     (rec__test_goto_borrow__list_cell__next
     (us_split_fields1 (rec__test_goto_borrow__list__pointer_value l1)))
     (- n1 1)))
     (= (nth l n) (ite (= n 1)
                  (to_rep
                  (rec__test_goto_borrow__list_cell__data
                  (us_split_fields1
                  (rec__test_goto_borrow__list__pointer_value l))))
                  (nth
                  (rec__test_goto_borrow__list_cell__next
                  (us_split_fields1
                  (rec__test_goto_borrow__list__pointer_value l))) (- n 1)))))) :pattern (
  (nth l n)) ))))

(declare-const l__pointer_address Int)

(declare-const l__is_null_pointer Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const v Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const dummy7 us_rep)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_rep)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_rep (t5b__content
                                                                    a))

(declare-const dummy8 us_rep)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_rep)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) us_rep (t8b__content
                                                                    a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

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
  (forall ((l us_rep))
  (! (let ((result (length l)))
     (=> (length__function_guard result l) (dynamic_invariant1 result true
     false true true))) :pattern ((length l)) )))

;; nth__post_axiom
  (assert
  (forall ((l us_rep))
  (forall ((n Int))
  (! (and (forall ((l1 us_rep)) (length__function_guard (length l1) l1))
     (=> (and (dynamic_invariant2 n true true true true) (<= n (length l)))
     (let ((result (nth l n)))
     (=> (nth__function_guard result l n) (dynamic_invariant result true
     false true true))))) :pattern ((nth l n)) ))))

(assert
;; defqtvc
 ;; File "test_goto_borrow.adb", line 24, characters 0-0
  (not
  (forall ((l__pointer_value us_split_fields) (i Int) (usf us_pledge_ty)
  (test_goto_borrow__truncate_after_v__B_1__d__pledge us_pledge_ty))
  (=> (dynamic_invariant v true false true true)
  (=> (dynamic_invariant1 i false false true true)
  (=>
  (forall ((l__pointer_value1 us_split_fields)) (length__function_guard
  (length
  (us_repqtmk l__is_null_pointer l__pointer_address
  (us_close (us_repqtmk1 l__pointer_value1))))
  (us_repqtmk l__is_null_pointer l__pointer_address
  (us_close (us_repqtmk1 l__pointer_value1)))))
  (=>
  (< (length
     (us_repqtmk l__is_null_pointer l__pointer_address
     (us_close (us_repqtmk1 l__pointer_value)))) 2147483647)
  (=>
  (forall ((temp___borrowed_265 us_rep))
  (forall ((temp___brower_264 us_rep))
  (! (= (= (us_pledge_get usf temp___borrowed_265 temp___brower_264) true)
     (= temp___borrowed_265 temp___brower_264)) :pattern ((us_pledge_get usf
                                                          temp___borrowed_265
                                                          temp___brower_264)) )))
  (=> (= test_goto_borrow__truncate_after_v__B_1__d__pledge usf)
  (forall ((d__pointer_value us_split_fields))
  (=>
  (= (us_repqtmk1 d__pointer_value) (rec__test_goto_borrow__list__pointer_value
                                    (us_repqtmk l__is_null_pointer
                                    l__pointer_address
                                    (us_close (us_repqtmk1 l__pointer_value)))))
  (forall ((d__pointer_address Int))
  (=> (= d__pointer_address l__pointer_address)
  (forall ((d__is_null_pointer Bool))
  (=> (= d__is_null_pointer l__is_null_pointer)
  (forall ((i1 Int))
  (=> (= i1 0)
  (=>
  (= (not (bool_eq
          (us_repqtmk d__is_null_pointer d__pointer_address
          (us_close (us_repqtmk1 d__pointer_value))) us_null_pointer)) true)
  (=>
  (forall ((d__pointer_value1 us_split_fields) (d__pointer_address1 Int)
  (d__is_null_pointer1 Bool)) (length__function_guard
  (length
  (us_repqtmk d__is_null_pointer1 d__pointer_address1
  (us_close (us_repqtmk1 d__pointer_value1))))
  (us_repqtmk d__is_null_pointer1 d__pointer_address1
  (us_close (us_repqtmk1 d__pointer_value1)))))
  (let ((usf1 (length
              (us_repqtmk d__is_null_pointer d__pointer_address
              (us_close (us_repqtmk1 d__pointer_value))))))
  (let ((o (us_repqtmk d__is_null_pointer d__pointer_address
           (us_close (us_repqtmk1 d__pointer_value)))))
  (let ((o1 (length o)))
  (=>
  (forall ((o2 us_rep)) (length__function_guard
  (length
  (rec__test_goto_borrow__list_cell__next
  (us_split_fields1 (rec__test_goto_borrow__list__pointer_value o2))))
  (rec__test_goto_borrow__list_cell__next
  (us_split_fields1 (rec__test_goto_borrow__list__pointer_value o2)))))
  (=>
  (and (length__function_guard o1 o)
  (and (dynamic_invariant1 o1 true false true true)
  (= o1 (ite (= (bool_eq o us_null_pointer) true) 0
        (+ (min 2147483646
           (length
           (rec__test_goto_borrow__list_cell__next
           (us_split_fields1 (rec__test_goto_borrow__list__pointer_value o))))) 1)))))
  (=> (in_range1 (- usf1 o1))
  (forall ((i2 Int) (d__pointer_value1 us_split_fields)
  (d__pointer_address1 Int) (d__is_null_pointer1 Bool)
  (test_goto_borrow__truncate_after_v__B_1__d__pledge1 us_pledge_ty))
  (let ((test_goto_borrow__truncate_after_v__B_1__d__pledge2 (us_pledge_ty__refqtmk
                                                             test_goto_borrow__truncate_after_v__B_1__d__pledge1)))
  (=>
  (forall ((d__pointer_value2 us_split_fields) (d__pointer_address2 Int)
  (d__is_null_pointer2 Bool)) (length__function_guard
  (length
  (us_repqtmk d__is_null_pointer2 d__pointer_address2
  (us_close (us_repqtmk1 d__pointer_value2))))
  (us_repqtmk d__is_null_pointer2 d__pointer_address2
  (us_close (us_repqtmk1 d__pointer_value2)))))
  (=>
  (forall ((temp___borrowed_255 us_rep)) (length__function_guard
  (length temp___borrowed_255) temp___borrowed_255))
  (=>
  (forall ((temp___brower_254 us_rep)) (length__function_guard
  (length temp___brower_254) temp___brower_254))
  (=>
  (forall ((temp___borrowed_245 us_rep)) (length__function_guard
  (length temp___borrowed_245) temp___borrowed_245))
  (=>
  (forall ((i3 Int) (temp___brower_244 us_rep) (k Int)) (nth__function_guard
  (nth temp___brower_244 (- k i3)) temp___brower_244 (- k i3)))
  (=>
  (forall ((temp___borrowed_245 us_rep) (k Int)) (nth__function_guard
  (nth temp___borrowed_245 k) temp___borrowed_245 k))
  (=>
  (forall ((temp___brower_230 us_rep)) (length__function_guard
  (length temp___brower_230) temp___brower_230))
  (=>
  (forall ((temp___brower_230 us_rep) (k Int)) (nth__function_guard
  (nth temp___brower_230 k) temp___brower_230 k))
  (=>
  (forall ((i3 Int) (temp___borrowed_231 us_rep) (k Int))
  (nth__function_guard (nth temp___borrowed_231 (+ k i3)) temp___borrowed_231
  (+ k i3)))
  (=>
  (and
  (= i2 (- usf1 (length
                (us_repqtmk d__is_null_pointer1 d__pointer_address1
                (us_close (us_repqtmk1 d__pointer_value1))))))
  (and
  (forall ((temp___borrowed_255 us_rep))
  (forall ((temp___brower_254 us_rep))
  (! (=>
     (and
     (= (us_pledge_get test_goto_borrow__truncate_after_v__B_1__d__pledge1
        temp___borrowed_255 temp___brower_254) true)
     (and
     (= l__is_null_pointer (rec__test_goto_borrow__list__is_null_pointer
                           temp___borrowed_255))
     (= d__is_null_pointer1 (rec__test_goto_borrow__list__is_null_pointer
                            temp___brower_254))))
     (= (length temp___borrowed_255) (+ i2 (min (length temp___brower_254)
                                           (- 2147483647 i2))))) :pattern (
  (us_pledge_get
  (us_pledge_ty__content test_goto_borrow__truncate_after_v__B_1__d__pledge2)
  temp___borrowed_255 temp___brower_254)) )))
  (and
  (forall ((temp___borrowed_245 us_rep))
  (forall ((temp___brower_244 us_rep))
  (! (=>
     (and
     (= (us_pledge_get test_goto_borrow__truncate_after_v__B_1__d__pledge1
        temp___borrowed_245 temp___brower_244) true)
     (and
     (= l__is_null_pointer (rec__test_goto_borrow__list__is_null_pointer
                           temp___borrowed_245))
     (= d__is_null_pointer1 (rec__test_goto_borrow__list__is_null_pointer
                            temp___brower_244))))
     (forall ((k Int))
     (=> (and (<= (+ i2 1) k) (<= k (length temp___borrowed_245)))
     (= (nth temp___brower_244 (- k i2)) (nth temp___borrowed_245 k))))) :pattern (
  (us_pledge_get
  (us_pledge_ty__content test_goto_borrow__truncate_after_v__B_1__d__pledge2)
  temp___borrowed_245 temp___brower_244)) )))
  (forall ((temp___borrowed_231 us_rep))
  (forall ((temp___brower_230 us_rep))
  (! (=>
     (and
     (= (us_pledge_get test_goto_borrow__truncate_after_v__B_1__d__pledge1
        temp___borrowed_231 temp___brower_230) true)
     (and
     (= l__is_null_pointer (rec__test_goto_borrow__list__is_null_pointer
                           temp___borrowed_231))
     (= d__is_null_pointer1 (rec__test_goto_borrow__list__is_null_pointer
                            temp___brower_230))))
     (forall ((k Int))
     (=>
     (and (<= 1 k) (<= k (min (length temp___brower_230) (- 2147483647 i2))))
     (= (nth temp___brower_230 k) (nth temp___borrowed_231 (+ k i2)))))) :pattern (
  (us_pledge_get
  (us_pledge_ty__content test_goto_borrow__truncate_after_v__B_1__d__pledge2)
  temp___borrowed_231 temp___brower_230)) ))))))
  (=>
  (= (and (ite (dynamic_invariant1 i2 false true true true) true false) 
  (ite (not
       (= (bool_eq
          (us_repqtmk d__is_null_pointer1 d__pointer_address1
          (us_close (us_repqtmk1 d__pointer_value1))) us_null_pointer) true))
  true false)) true) (in_range1 (+ i2 1))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
