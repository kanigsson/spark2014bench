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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__p__B_2__list_acc__is_null_pointer Bool)(rec__p__B_2__list_acc__pointer_address Int)(rec__p__B_2__list_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__p__B_2__list_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__p__B_2__list_acc__is_null_pointer a))

(define-fun us_rep_rec__p__B_2__list_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__p__B_2__list_acc__pointer_address a))

(define-fun us_rep_rec__p__B_2__list_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__p__B_2__list_acc__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__p__B_2__list_acc__is_null_pointer a) 
                        (rec__p__B_2__list_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__p__B_2__list_acc__is_null_pointer a) true))
                        (and
                        (= (rec__p__B_2__list_acc__pointer_address a) 
                        (rec__p__B_2__list_acc__pointer_address b))
                        (= (rec__p__B_2__list_acc__pointer_value_abstr a) 
                        (rec__p__B_2__list_acc__pointer_value_abstr b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((list_acc__ref 0))
(((list_acc__refqtmk (list_acc__content us_rep)))))
(define-fun list_acc__ref_list_acc__content__projection ((a list_acc__ref)) us_rep 
  (list_acc__content a))

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__B_2__list_d__d Bool)))))
(define-fun us_split_discrs_rec__p__B_2__list_d__d__projection ((a us_split_discrs)) Bool 
  (rec__p__B_2__list_d__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__p__B_2__list_d__val integer)(rec__p__B_2__list_d__next us_rep)))))
(define-fun us_split_fields_rec__p__B_2__list_d__val__projection ((a us_split_fields)) integer 
  (rec__p__B_2__list_d__val a))

(define-fun us_split_fields_rec__p__B_2__list_d__next__projection ((a us_split_fields)) us_rep 
  (rec__p__B_2__list_d__next a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (ite (rec__p__B_2__list_d__d
                                 (us_split_discrs1 a)) 1 0) (ite (rec__p__B_2__list_d__d
                                                                 (us_split_discrs1
                                                                 b)) 1 0))
                         (and
                         (= (to_rep
                            (rec__p__B_2__list_d__val (us_split_fields1 a))) 
                         (to_rep
                         (rec__p__B_2__list_d__val (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__p__B_2__list_d__next (us_split_fields1 a))
                            (rec__p__B_2__list_d__next (us_split_fields1 b))) true)))
                    true false))

(define-fun in_range2 ((rec__p__B_2__list_d__d1 Bool)
  (a us_split_discrs)) Bool (= rec__p__B_2__list_d__d1 (rec__p__B_2__list_d__d
                                                       a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p__B_2__list_d__d__first__bit Int)

(declare-const p__B_2__list_d__d__last__bit Int)

(declare-const p__B_2__list_d__d__position Int)

;; p__B_2__list_d__d__first__bit_axiom
  (assert (<= 0 p__B_2__list_d__d__first__bit))

;; p__B_2__list_d__d__last__bit_axiom
  (assert (< p__B_2__list_d__d__first__bit p__B_2__list_d__d__last__bit))

;; p__B_2__list_d__d__position_axiom
  (assert (<= 0 p__B_2__list_d__d__position))

(declare-const p__B_2__list_d__val__first__bit Int)

(declare-const p__B_2__list_d__val__last__bit Int)

(declare-const p__B_2__list_d__val__position Int)

;; p__B_2__list_d__val__first__bit_axiom
  (assert (<= 0 p__B_2__list_d__val__first__bit))

;; p__B_2__list_d__val__last__bit_axiom
  (assert (< p__B_2__list_d__val__first__bit p__B_2__list_d__val__last__bit))

;; p__B_2__list_d__val__position_axiom
  (assert (<= 0 p__B_2__list_d__val__position))

(declare-const p__B_2__list_d__next__first__bit Int)

(declare-const p__B_2__list_d__next__last__bit Int)

(declare-const p__B_2__list_d__next__position Int)

;; p__B_2__list_d__next__first__bit_axiom
  (assert (<= 0 p__B_2__list_d__next__first__bit))

;; p__B_2__list_d__next__last__bit_axiom
  (assert
  (< p__B_2__list_d__next__first__bit p__B_2__list_d__next__last__bit))

;; p__B_2__list_d__next__position_axiom
  (assert (<= 0 p__B_2__list_d__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((list_d__ref 0))
(((list_d__refqtmk (list_d__content us_rep1)))))
(define-fun list_d__ref_list_d__content__projection ((a list_d__ref)) us_rep1 
  (list_d__content a))

(declare-const i6b us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort t1b 0)

(declare-fun t1bqtint (t1b) Int)

;; t1b'axiom
  (assert (forall ((i t1b)) (and (<= 1 (t1bqtint i)) (<= (t1bqtint i) 10))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t1b t1b) Bool)

(declare-const dummy3 t1b)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content t1b)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) t1b (t1b__content
                                                                 a))

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x1 us_main_type))
  (! (= (us_close (us_open x1)) x1) :pattern ((us_open x1)) )))

;; open_close
  (assert
  (forall ((x1 us_rep1))
  (! (= (us_open (us_close x1)) x1) :pattern ((us_close x1)) )))

(define-fun rec__p__B_2__list_acc__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__p__B_2__list_acc__pointer_value_abstr a)))

(define-fun rec__p__B_2__list_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__p__B_2__list_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__p__B_2__list_acc__is_null_pointer us_null_pointer) true))

(declare-fun temp___dynamic_invariant_185 (us_rep Bool Bool Bool Bool
  Int) Bool)

(define-fun dynamic_invariant ((temp___expr_182 us_rep)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool) (temp___do_typ_inv_181 Bool)
  (p__L_1__i Int)) Bool (=>
                        (not
                        (= (rec__p__B_2__list_acc__is_null_pointer
                           temp___expr_182) true))
                        (and
                        (let ((temp___183 (rec__p__B_2__list_acc__pointer_value
                                          temp___expr_182)))
                        (=>
                        (= (rec__p__B_2__list_d__d
                           (us_split_discrs1 temp___183)) true)
                        (< p__L_1__i (to_rep
                                     (rec__p__B_2__list_d__val
                                     (us_split_fields1 temp___183))))))
                        (temp___dynamic_invariant_185
                        (rec__p__B_2__list_d__next
                        (us_split_fields1
                        (rec__p__B_2__list_acc__pointer_value
                        temp___expr_182))) true false true
                        temp___do_typ_inv_181 p__L_1__i))))

;; def_axiom
  (assert
  (forall ((temp___expr_190 us_rep))
  (forall ((temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool) (temp___do_typ_inv_189 Bool))
  (forall ((p__L_1__i Int))
  (! (= (temp___dynamic_invariant_185 temp___expr_190 temp___is_init_186
     temp___skip_constant_187 temp___do_toplevel_188 temp___do_typ_inv_189
     p__L_1__i)
     (=>
     (not (= (rec__p__B_2__list_acc__is_null_pointer temp___expr_190) true))
     (and
     (let ((temp___191 (rec__p__B_2__list_acc__pointer_value temp___expr_190)))
     (=> (= (rec__p__B_2__list_d__d (us_split_discrs1 temp___191)) true)
     (< p__L_1__i (to_rep
                  (rec__p__B_2__list_d__val (us_split_fields1 temp___191))))))
     (temp___dynamic_invariant_185
     (rec__p__B_2__list_d__next
     (us_split_fields1
     (rec__p__B_2__list_acc__pointer_value temp___expr_190))) true false true
     temp___do_typ_inv_189 p__L_1__i)))) :pattern ((temp___dynamic_invariant_185
  temp___expr_190 temp___is_init_186 temp___skip_constant_187
  temp___do_toplevel_188 temp___do_typ_inv_189 p__L_1__i)) )))))

(define-fun default_initial_assumption ((temp___expr_193 us_rep)
  (temp___skip_top_level_194 Bool)) Bool (= (rec__p__B_2__list_acc__is_null_pointer
                                            temp___expr_193) true))

(define-fun dynamic_invariant1 ((temp___expr_199 us_rep1)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool) (temp___do_typ_inv_198 Bool)
  (p__L_1__i Int)) Bool (and
                        (=> (= temp___do_toplevel_197 true)
                        (=>
                        (= (rec__p__B_2__list_d__d
                           (us_split_discrs1 temp___expr_199)) true)
                        (< p__L_1__i (to_rep
                                     (rec__p__B_2__list_d__val
                                     (us_split_fields1 temp___expr_199))))))
                        (=>
                        (not
                        (= (rec__p__B_2__list_acc__is_null_pointer
                           (rec__p__B_2__list_d__next
                           (us_split_fields1 temp___expr_199))) true))
                        (and
                        (let ((temp___202 (rec__p__B_2__list_acc__pointer_value
                                          (rec__p__B_2__list_d__next
                                          (us_split_fields1 temp___expr_199)))))
                        (=>
                        (= (rec__p__B_2__list_d__d
                           (us_split_discrs1 temp___202)) true)
                        (< p__L_1__i (to_rep
                                     (rec__p__B_2__list_d__val
                                     (us_split_fields1 temp___202))))))
                        (temp___dynamic_invariant_185
                        (rec__p__B_2__list_d__next
                        (us_split_fields1
                        (rec__p__B_2__list_acc__pointer_value
                        (rec__p__B_2__list_d__next
                        (us_split_fields1 temp___expr_199))))) true false
                        true temp___do_typ_inv_198 p__L_1__i)))))

(define-fun dynamic_predicate ((temp___204 us_rep1)
  (p__L_1__i Int)) Bool (=>
                        (= (rec__p__B_2__list_d__d
                           (us_split_discrs1 temp___204)) true)
                        (< p__L_1__i (to_rep
                                     (rec__p__B_2__list_d__val
                                     (us_split_fields1 temp___204))))))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "p.adb", line 15, characters 0-0
  (not
  (forall ((i Int))
  (=> (dynamic_invariant1 i6b true false true true i)
  (=> (dynamic_invariant1 i6b true false true true i)
  (=> (in_range3 i)
  (=> (dynamic_invariant x true false true true i)
  (=> (not (= (bool_eq x us_null_pointer) true))
  (=>
  (not
  (= (bool_eq
     (rec__p__B_2__list_d__next
     (us_split_fields1 (rec__p__B_2__list_acc__pointer_value x)))
     us_null_pointer) true))
  (=>
  (not
  (= (bool_eq
     (rec__p__B_2__list_d__next
     (us_split_fields1
     (rec__p__B_2__list_acc__pointer_value
     (rec__p__B_2__list_d__next
     (us_split_fields1 (rec__p__B_2__list_acc__pointer_value x))))))
     us_null_pointer) true))
  (forall ((o Int))
  (=>
  (= (to_rep
     (rec__p__B_2__list_d__val
     (us_split_fields1
     (rec__p__B_2__list_acc__pointer_value
     (rec__p__B_2__list_d__next
     (us_split_fields1
     (rec__p__B_2__list_acc__pointer_value
     (rec__p__B_2__list_d__next
     (us_split_fields1 (rec__p__B_2__list_acc__pointer_value x)))))))))) o)
  (forall ((p__B_2__f__result Int))
  (=> (= p__B_2__f__result o) (rec__p__B_2__list_acc__pointer_value__pred x)))))))))))))))
(check-sat)
(exit)
