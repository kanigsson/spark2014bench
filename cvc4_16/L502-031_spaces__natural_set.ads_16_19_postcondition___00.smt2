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

(declare-sort set_length 0)

(declare-fun set_lengthqtint (set_length) Int)

;; set_length'axiom
  (assert
  (forall ((i set_length))
  (and (<= 0 (set_lengthqtint i)) (<= (set_lengthqtint i) 10))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (set_length set_length) Bool)

(declare-const dummy set_length)

(declare-datatypes ((set_length__ref 0))
(((set_length__refqtmk (set_length__content set_length)))))
(define-fun set_length__ref_set_length__content__projection ((a set_length__ref)) set_length 
  (set_length__content a))

(define-fun to_rep ((x set_length)) Int (set_lengthqtint x))

(declare-fun of_rep (Int) set_length)

;; inversion_axiom
  (assert
  (forall ((x set_length))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x set_length)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort element_t 0)

(declare-fun element_tqtint (element_t) Int)

;; element_t'axiom
  (assert
  (forall ((i element_t))
  (and (<= (- 1) (element_tqtint i)) (<= (element_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1) x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (element_t element_t) Bool)

(declare-const dummy1 element_t)

(declare-datatypes ((element_t__ref 0))
(((element_t__refqtmk (element_t__content element_t)))))
(define-fun element_t__ref_element_t__content__projection ((a element_t__ref)) element_t 
  (element_t__content a))

(define-fun to_rep1 ((x element_t)) Int (element_tqtint x))

(declare-fun of_rep1 (Int) element_t)

;; inversion_axiom
  (assert
  (forall ((x element_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_t)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element_t))))))
(declare-fun slide ((Array Int element_t) Int Int) (Array Int element_t))

;; slide_eq
  (assert
  (forall ((a (Array Int element_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element_t)) (a__first Int) (a__last Int)
  (b (Array Int element_t)) (b__first Int)
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
  (forall ((a (Array Int element_t)) (b (Array Int element_t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int element_t))

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

(declare-fun user_eq2 ((Array Int element_t) (Array Int element_t)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__natural_set__t__len set_length)(rec__natural_set__t__m (Array Int element_t))))))
(define-fun us_split_fields_rec__natural_set__t__len__projection ((a us_split_fields)) set_length 
  (rec__natural_set__t__len a))

(define-fun us_split_fields_rec__natural_set__t__m__projection ((a us_split_fields)) (Array Int element_t) 
  (rec__natural_set__t__m a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__natural_set__t__len (us_split_fields1 a))) 
                        (to_rep
                        (rec__natural_set__t__len (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__natural_set__t__m (us_split_fields1 a)) 1 10
                           (rec__natural_set__t__m (us_split_fields1 b)) 1
                           10) true))
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

(declare-const natural_set__t__len__first__bit Int)

(declare-const natural_set__t__len__last__bit Int)

(declare-const natural_set__t__len__position Int)

;; natural_set__t__len__first__bit_axiom
  (assert (<= 0 natural_set__t__len__first__bit))

;; natural_set__t__len__last__bit_axiom
  (assert (< natural_set__t__len__first__bit natural_set__t__len__last__bit))

;; natural_set__t__len__position_axiom
  (assert (<= 0 natural_set__t__len__position))

(declare-const natural_set__t__m__first__bit Int)

(declare-const natural_set__t__m__last__bit Int)

(declare-const natural_set__t__m__position Int)

;; natural_set__t__m__first__bit_axiom
  (assert (<= 0 natural_set__t__m__first__bit))

;; natural_set__t__m__last__bit_axiom
  (assert (< natural_set__t__m__first__bit natural_set__t__m__last__bit))

;; natural_set__t__m__position_axiom
  (assert (<= 0 natural_set__t__m__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-fun valid (us_rep) Bool)

(declare-fun valid__function_guard (Bool us_rep) Bool)

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

(declare-fun user_eq4 (natural natural) Bool)

(declare-const dummy4 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

;; valid__post_axiom
  (assert true)

;; valid__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (= (valid s) true)
     (and
     (forall ((i Int))
     (=>
     (and (<= 1 i)
     (<= i (to_rep (rec__natural_set__t__len (us_split_fields1 s)))))
     (in_range2
     (to_rep1
     (let ((temp___207 (rec__natural_set__t__m (us_split_fields1 s))))
     (select temp___207 i))))))
     (forall ((i Int))
     (=>
     (and
     (<= (+ (to_rep (rec__natural_set__t__len (us_split_fields1 s))) 1) i)
     (<= i 10))
     (= (to_rep1
        (let ((temp___209 (rec__natural_set__t__m (us_split_fields1 s))))
        (select temp___209 i))) (- 1)))))) :pattern ((valid s)) )))

(declare-fun members (us_rep) Int)

(declare-fun members__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

;; members__post_axiom
  (assert
  (forall ((s us_rep))
  (! (let ((result (members s)))
     (=> (members__function_guard result s)
     (and (and (<= 0 result) (<= result 10)) (dynamic_invariant result true
     false true true)))) :pattern ((members s)) )))

;; members__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (members s) (to_rep (rec__natural_set__t__len (us_split_fields1 s)))) :pattern (
  (members s)) )))

(declare-fun full (us_rep) Bool)

(declare-fun full__function_guard (Bool us_rep) Bool)

;; full__post_axiom
  (assert true)

;; full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (members__function_guard (members s1) s1))
     (= (= (full s) true) (= (members s) 10))) :pattern ((full s)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun temp_____aggregate_def_242 (Int) (Array Int element_t))

(define-fun dynamic_invariant1 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= (- 1) 2147483647)) (in_range1
                                     temp___expr_177)))

(declare-const rliteral element_t)

;; rliteral_axiom
  (assert (= (element_tqtint rliteral) (- 1)))

;; def_axiom
  (assert
  (forall ((temp___244 Int))
  (=> (dynamic_invariant1 temp___244 true true true true)
  (forall ((temp___245 Int))
  (= (select (temp_____aggregate_def_242 temp___244) temp___245) rliteral)))))

(define-fun dynamic_invariant2 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 10)) (in_range temp___expr_163)))

(declare-const rliteral1 set_length)

;; rliteral_axiom
  (assert (= (set_lengthqtint rliteral1) 0))

(assert
;; defqtvc
 ;; File "natural_set.ads", line 15, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields))
  (=>
  (= s__split_fields (us_split_fieldsqtmk rliteral1
                     (temp_____aggregate_def_242 (- 1))))
  (=>
  (forall ((s__split_fields1 us_split_fields)) (valid__function_guard
  (valid (us_repqtmk s__split_fields1)) (us_repqtmk s__split_fields1)))
  (= (valid (us_repqtmk s__split_fields)) true))))))
(check-sat)
(exit)
