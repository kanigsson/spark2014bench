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

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__rec_inv__list_acc__is_null_pointer Bool)(rec__rec_inv__list_acc__pointer_address Int)(rec__rec_inv__list_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__rec_inv__list_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__rec_inv__list_acc__is_null_pointer a))

(define-fun us_rep_rec__rec_inv__list_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__rec_inv__list_acc__pointer_address a))

(define-fun us_rep_rec__rec_inv__list_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__rec_inv__list_acc__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__rec_inv__list_acc__is_null_pointer a) 
                        (rec__rec_inv__list_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__rec_inv__list_acc__is_null_pointer a) true))
                        (and
                        (= (rec__rec_inv__list_acc__pointer_address a) 
                        (rec__rec_inv__list_acc__pointer_address b))
                        (= (rec__rec_inv__list_acc__pointer_value_abstr a) 
                        (rec__rec_inv__list_acc__pointer_value_abstr b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((list_acc__ref 0))
(((list_acc__refqtmk (list_acc__content us_rep)))))
(define-fun list_acc__ref_list_acc__content__projection ((a list_acc__ref)) us_rep 
  (list_acc__content a))

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

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__rec_inv__list_d__d Bool)))))
(define-fun us_split_discrs_rec__rec_inv__list_d__d__projection ((a us_split_discrs)) Bool 
  (rec__rec_inv__list_d__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__rec_inv__list_d__val integer)(rec__rec_inv__list_d__next us_rep)))))
(define-fun us_split_fields_rec__rec_inv__list_d__val__projection ((a us_split_fields)) integer 
  (rec__rec_inv__list_d__val a))

(define-fun us_split_fields_rec__rec_inv__list_d__next__projection ((a us_split_fields)) us_rep 
  (rec__rec_inv__list_d__next a))

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
                         (= (ite (rec__rec_inv__list_d__d
                                 (us_split_discrs1 a)) 1 0) (ite (rec__rec_inv__list_d__d
                                                                 (us_split_discrs1
                                                                 b)) 1 0))
                         (and
                         (= (to_rep
                            (rec__rec_inv__list_d__val (us_split_fields1 a))) 
                         (to_rep
                         (rec__rec_inv__list_d__val (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__rec_inv__list_d__next (us_split_fields1 a))
                            (rec__rec_inv__list_d__next (us_split_fields1 b))) true)))
                    true false))

(define-fun in_range2 ((rec__rec_inv__list_d__d1 Bool)
  (a us_split_discrs)) Bool (= rec__rec_inv__list_d__d1 (rec__rec_inv__list_d__d
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

(declare-const rec_inv__list_d__d__first__bit Int)

(declare-const rec_inv__list_d__d__last__bit Int)

(declare-const rec_inv__list_d__d__position Int)

;; rec_inv__list_d__d__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__d__first__bit))

;; rec_inv__list_d__d__last__bit_axiom
  (assert (< rec_inv__list_d__d__first__bit rec_inv__list_d__d__last__bit))

;; rec_inv__list_d__d__position_axiom
  (assert (<= 0 rec_inv__list_d__d__position))

(declare-const rec_inv__list_d__val__first__bit Int)

(declare-const rec_inv__list_d__val__last__bit Int)

(declare-const rec_inv__list_d__val__position Int)

;; rec_inv__list_d__val__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__val__first__bit))

;; rec_inv__list_d__val__last__bit_axiom
  (assert
  (< rec_inv__list_d__val__first__bit rec_inv__list_d__val__last__bit))

;; rec_inv__list_d__val__position_axiom
  (assert (<= 0 rec_inv__list_d__val__position))

(declare-const rec_inv__list_d__next__first__bit Int)

(declare-const rec_inv__list_d__next__last__bit Int)

(declare-const rec_inv__list_d__next__position Int)

;; rec_inv__list_d__next__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__next__first__bit))

;; rec_inv__list_d__next__last__bit_axiom
  (assert
  (< rec_inv__list_d__next__first__bit rec_inv__list_d__next__last__bit))

;; rec_inv__list_d__next__position_axiom
  (assert (<= 0 rec_inv__list_d__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((list_d__ref 0))
(((list_d__refqtmk (list_d__content us_rep1)))))
(define-fun list_d__ref_list_d__content__projection ((a list_d__ref)) us_rep1 
  (list_d__content a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const rec_inv__list_d__d__first__bit1 Int)

(declare-const rec_inv__list_d__d__last__bit1 Int)

(declare-const rec_inv__list_d__d__position1 Int)

;; rec_inv__list_d__d__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__d__first__bit1))

;; rec_inv__list_d__d__last__bit_axiom
  (assert (< rec_inv__list_d__d__first__bit1 rec_inv__list_d__d__last__bit1))

;; rec_inv__list_d__d__position_axiom
  (assert (<= 0 rec_inv__list_d__d__position1))

(declare-const rec_inv__list_d__val__first__bit1 Int)

(declare-const rec_inv__list_d__val__last__bit1 Int)

(declare-const rec_inv__list_d__val__position1 Int)

;; rec_inv__list_d__val__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__val__first__bit1))

;; rec_inv__list_d__val__last__bit_axiom
  (assert
  (< rec_inv__list_d__val__first__bit1 rec_inv__list_d__val__last__bit1))

;; rec_inv__list_d__val__position_axiom
  (assert (<= 0 rec_inv__list_d__val__position1))

(declare-const rec_inv__list_d__next__first__bit1 Int)

(declare-const rec_inv__list_d__next__last__bit1 Int)

(declare-const rec_inv__list_d__next__position1 Int)

;; rec_inv__list_d__next__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__next__first__bit1))

;; rec_inv__list_d__next__last__bit_axiom
  (assert
  (< rec_inv__list_d__next__first__bit1 rec_inv__list_d__next__last__bit1))

;; rec_inv__list_d__next__position_axiom
  (assert (<= 0 rec_inv__list_d__next__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((txS__ref 0))
(((txS__refqtmk (txS__content us_rep1)))))
(define-fun txS__ref_txS__content__projection ((a txS__ref)) us_rep1 
  (txS__content a))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

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

(define-fun rec__rec_inv__list_acc__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__rec_inv__list_acc__pointer_value_abstr a)))

(define-fun rec__rec_inv__list_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__rec_inv__list_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__rec_inv__list_acc__is_null_pointer us_null_pointer) true))

(declare-fun temp___dynamic_invariant_188 (us_rep Bool Bool Bool Bool) Bool)

(define-fun dynamic_invariant ((temp___expr_185 us_rep)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (not
                                     (= (rec__rec_inv__list_acc__is_null_pointer
                                        temp___expr_185) true))
                                     (and
                                     (let ((temp___186 (rec__rec_inv__list_acc__pointer_value
                                                       temp___expr_185)))
                                     (=>
                                     (= (rec__rec_inv__list_d__d
                                        (us_split_discrs1 temp___186)) true)
                                     (< 0 (to_rep
                                          (rec__rec_inv__list_d__val
                                          (us_split_fields1 temp___186))))))
                                     (temp___dynamic_invariant_188
                                     (rec__rec_inv__list_d__next
                                     (us_split_fields1
                                     (rec__rec_inv__list_acc__pointer_value
                                     temp___expr_185))) true false true
                                     temp___do_typ_inv_184))))

;; def_axiom
  (assert
  (forall ((temp___expr_193 us_rep))
  (forall ((temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool) (temp___do_typ_inv_192 Bool))
  (! (= (temp___dynamic_invariant_188 temp___expr_193 temp___is_init_189
     temp___skip_constant_190 temp___do_toplevel_191 temp___do_typ_inv_192)
     (=>
     (not (= (rec__rec_inv__list_acc__is_null_pointer temp___expr_193) true))
     (and
     (let ((temp___194 (rec__rec_inv__list_acc__pointer_value
                       temp___expr_193)))
     (=> (= (rec__rec_inv__list_d__d (us_split_discrs1 temp___194)) true)
     (< 0 (to_rep (rec__rec_inv__list_d__val (us_split_fields1 temp___194))))))
     (temp___dynamic_invariant_188
     (rec__rec_inv__list_d__next
     (us_split_fields1
     (rec__rec_inv__list_acc__pointer_value temp___expr_193))) true false
     true temp___do_typ_inv_192)))) :pattern ((temp___dynamic_invariant_188
  temp___expr_193 temp___is_init_189 temp___skip_constant_190
  temp___do_toplevel_191 temp___do_typ_inv_192)) ))))

(define-fun default_initial_assumption ((temp___expr_196 us_rep)
  (temp___skip_top_level_197 Bool)) Bool (= (rec__rec_inv__list_acc__is_null_pointer
                                            temp___expr_196) true))

(define-fun dynamic_invariant1 ((temp___expr_213 us_rep1)
  (temp___is_init_209 Bool) (temp___skip_constant_210 Bool)
  (temp___do_toplevel_211 Bool)
  (temp___do_typ_inv_212 Bool)) Bool (and
                                     (and
                                     (=>
                                     (not (= temp___skip_constant_210 true))
                                     (in_range2 (distinct 1 0)
                                     (us_split_discrs1 temp___expr_213)))
                                     (=>
                                     (= (rec__rec_inv__list_d__d
                                        (us_split_discrs1 temp___expr_213)) true)
                                     (< 0 (to_rep
                                          (rec__rec_inv__list_d__val
                                          (us_split_fields1 temp___expr_213))))))
                                     (=>
                                     (not
                                     (= (rec__rec_inv__list_acc__is_null_pointer
                                        (rec__rec_inv__list_d__next
                                        (us_split_fields1 temp___expr_213))) true))
                                     (and
                                     (let ((temp___218 (rec__rec_inv__list_acc__pointer_value
                                                       (rec__rec_inv__list_d__next
                                                       (us_split_fields1
                                                       temp___expr_213)))))
                                     (=>
                                     (= (rec__rec_inv__list_d__d
                                        (us_split_discrs1 temp___218)) true)
                                     (< 0 (to_rep
                                          (rec__rec_inv__list_d__val
                                          (us_split_fields1 temp___218))))))
                                     (temp___dynamic_invariant_188
                                     (rec__rec_inv__list_d__next
                                     (us_split_fields1
                                     (rec__rec_inv__list_acc__pointer_value
                                     (rec__rec_inv__list_d__next
                                     (us_split_fields1 temp___expr_213)))))
                                     true false true temp___do_typ_inv_212)))))

(define-fun default_initial_assumption1 ((temp___expr_220 us_rep1)
  (temp___skip_top_level_221 Bool)) Bool (and
                                         (= (rec__rec_inv__list_d__d
                                            (us_split_discrs1
                                            temp___expr_220)) (distinct 1 0))
                                         (= (rec__rec_inv__list_acc__is_null_pointer
                                            (rec__rec_inv__list_d__next
                                            (us_split_fields1
                                            temp___expr_220))) true)))

(define-fun dynamic_predicate ((temp___225 us_rep1)) Bool (=>
                                                          (= (rec__rec_inv__list_d__d
                                                             (us_split_discrs1
                                                             temp___225)) true)
                                                          (< 0 (to_rep
                                                               (rec__rec_inv__list_d__val
                                                               (us_split_fields1
                                                               temp___225))))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const rec_inv__list_d__d__first__bit2 Int)

(declare-const rec_inv__list_d__d__last__bit2 Int)

(declare-const rec_inv__list_d__d__position2 Int)

;; rec_inv__list_d__d__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__d__first__bit2))

;; rec_inv__list_d__d__last__bit_axiom
  (assert (< rec_inv__list_d__d__first__bit2 rec_inv__list_d__d__last__bit2))

;; rec_inv__list_d__d__position_axiom
  (assert (<= 0 rec_inv__list_d__d__position2))

(declare-const rec_inv__list_d__val__first__bit2 Int)

(declare-const rec_inv__list_d__val__last__bit2 Int)

(declare-const rec_inv__list_d__val__position2 Int)

;; rec_inv__list_d__val__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__val__first__bit2))

;; rec_inv__list_d__val__last__bit_axiom
  (assert
  (< rec_inv__list_d__val__first__bit2 rec_inv__list_d__val__last__bit2))

;; rec_inv__list_d__val__position_axiom
  (assert (<= 0 rec_inv__list_d__val__position2))

(declare-const rec_inv__list_d__next__first__bit2 Int)

(declare-const rec_inv__list_d__next__last__bit2 Int)

(declare-const rec_inv__list_d__next__position2 Int)

;; rec_inv__list_d__next__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__next__first__bit2))

;; rec_inv__list_d__next__last__bit_axiom
  (assert
  (< rec_inv__list_d__next__first__bit2 rec_inv__list_d__next__last__bit2))

;; rec_inv__list_d__next__position_axiom
  (assert (<= 0 rec_inv__list_d__next__position2))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content us_rep1)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_rep1 
  (t13b__content a))

(define-fun dynamic_predicate1 ((temp___228 us_rep1)) Bool (=>
                                                           (= (rec__rec_inv__list_d__d
                                                              (us_split_discrs1
                                                              temp___228)) true)
                                                           (< 0 (to_rep
                                                                (rec__rec_inv__list_d__val
                                                                (us_split_fields1
                                                                temp___228))))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const rec_inv__list_d__d__first__bit3 Int)

(declare-const rec_inv__list_d__d__last__bit3 Int)

(declare-const rec_inv__list_d__d__position3 Int)

;; rec_inv__list_d__d__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__d__first__bit3))

;; rec_inv__list_d__d__last__bit_axiom
  (assert (< rec_inv__list_d__d__first__bit3 rec_inv__list_d__d__last__bit3))

;; rec_inv__list_d__d__position_axiom
  (assert (<= 0 rec_inv__list_d__d__position3))

(declare-const rec_inv__list_d__val__first__bit3 Int)

(declare-const rec_inv__list_d__val__last__bit3 Int)

(declare-const rec_inv__list_d__val__position3 Int)

;; rec_inv__list_d__val__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__val__first__bit3))

;; rec_inv__list_d__val__last__bit_axiom
  (assert
  (< rec_inv__list_d__val__first__bit3 rec_inv__list_d__val__last__bit3))

;; rec_inv__list_d__val__position_axiom
  (assert (<= 0 rec_inv__list_d__val__position3))

(declare-const rec_inv__list_d__next__first__bit3 Int)

(declare-const rec_inv__list_d__next__last__bit3 Int)

(declare-const rec_inv__list_d__next__position3 Int)

;; rec_inv__list_d__next__first__bit_axiom
  (assert (<= 0 rec_inv__list_d__next__first__bit3))

;; rec_inv__list_d__next__last__bit_axiom
  (assert
  (< rec_inv__list_d__next__first__bit3 rec_inv__list_d__next__last__bit3))

;; rec_inv__list_d__next__position_axiom
  (assert (<= 0 rec_inv__list_d__next__position3))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content us_rep1)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) us_rep1 
  (t19b__content a))

(define-fun dynamic_predicate2 ((temp___230 us_rep1)) Bool (=>
                                                           (= (rec__rec_inv__list_d__d
                                                              (us_split_discrs1
                                                              temp___230)) true)
                                                           (< 0 (to_rep
                                                                (rec__rec_inv__list_d__val
                                                                (us_split_fields1
                                                                temp___230))))))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_202 us_rep1)
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool)
  (temp___do_typ_inv_201 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_200 true)
                                     (=>
                                     (= (rec__rec_inv__list_d__d
                                        (us_split_discrs1 temp___expr_202)) true)
                                     (< 0 (to_rep
                                          (rec__rec_inv__list_d__val
                                          (us_split_fields1 temp___expr_202))))))
                                     (=>
                                     (not
                                     (= (rec__rec_inv__list_acc__is_null_pointer
                                        (rec__rec_inv__list_d__next
                                        (us_split_fields1 temp___expr_202))) true))
                                     (and
                                     (let ((temp___205 (rec__rec_inv__list_acc__pointer_value
                                                       (rec__rec_inv__list_d__next
                                                       (us_split_fields1
                                                       temp___expr_202)))))
                                     (=>
                                     (= (rec__rec_inv__list_d__d
                                        (us_split_discrs1 temp___205)) true)
                                     (< 0 (to_rep
                                          (rec__rec_inv__list_d__val
                                          (us_split_fields1 temp___205))))))
                                     (temp___dynamic_invariant_188
                                     (rec__rec_inv__list_d__next
                                     (us_split_fields1
                                     (rec__rec_inv__list_acc__pointer_value
                                     (rec__rec_inv__list_d__next
                                     (us_split_fields1 temp___expr_202)))))
                                     true false true temp___do_typ_inv_201)))))

(define-fun dynamic_predicate3 ((temp___207 us_rep1)) Bool (=>
                                                           (= (rec__rec_inv__list_d__d
                                                              (us_split_discrs1
                                                              temp___207)) true)
                                                           (< 0 (to_rep
                                                                (rec__rec_inv__list_d__val
                                                                (us_split_fields1
                                                                temp___207))))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "rec_inv.adb", line 1, characters 0-0
  (not (dynamic_predicate1
  (us_repqtmk1 (us_split_discrsqtmk (distinct 1 0))
  (us_split_fieldsqtmk rliteral us_null_pointer)))))
(check-sat)
(exit)
