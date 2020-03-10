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

(declare-sort pointer_range 0)

(declare-fun pointer_rangeqtint (pointer_range) Int)

;; pointer_range'axiom
  (assert
  (forall ((i pointer_range))
  (and (<= 0 (pointer_rangeqtint i)) (<= (pointer_rangeqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (pointer_range pointer_range) Bool)

(declare-const dummy1 pointer_range)

(declare-datatypes ((pointer_range__ref 0))
(((pointer_range__refqtmk (pointer_range__content pointer_range)))))
(define-fun pointer_range__ref_pointer_range__content__projection ((a pointer_range__ref)) pointer_range 
  (pointer_range__content a))

(define-fun to_rep1 ((x pointer_range)) Int (pointer_rangeqtint x))

(declare-fun of_rep1 (Int) pointer_range)

;; inversion_axiom
  (assert
  (forall ((x pointer_range))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x pointer_range)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
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
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int integer))

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

(declare-fun user_eq2 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stack__stack_type__s (Array Int integer))(rec__stack__stack_type__pointer pointer_range)))))
(define-fun us_split_fields_rec__stack__stack_type__s__projection ((a us_split_fields)) (Array Int integer) 
  (rec__stack__stack_type__s a))

(define-fun us_split_fields_rec__stack__stack_type__pointer__projection ((a us_split_fields)) pointer_range 
  (rec__stack__stack_type__pointer a))

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
                        (= (bool_eq
                           (rec__stack__stack_type__s (us_split_fields1 a)) 1
                           100
                           (rec__stack__stack_type__s (us_split_fields1 b)) 1
                           100) true)
                        (= (to_rep1
                           (rec__stack__stack_type__pointer
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__stack__stack_type__pointer
                                                  (us_split_fields1 b)))))
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

(declare-const stack__stack_type__s__first__bit Int)

(declare-const stack__stack_type__s__last__bit Int)

(declare-const stack__stack_type__s__position Int)

;; stack__stack_type__s__first__bit_axiom
  (assert (<= 0 stack__stack_type__s__first__bit))

;; stack__stack_type__s__last__bit_axiom
  (assert
  (< stack__stack_type__s__first__bit stack__stack_type__s__last__bit))

;; stack__stack_type__s__position_axiom
  (assert (<= 0 stack__stack_type__s__position))

(declare-const stack__stack_type__pointer__first__bit Int)

(declare-const stack__stack_type__pointer__last__bit Int)

(declare-const stack__stack_type__pointer__position Int)

;; stack__stack_type__pointer__first__bit_axiom
  (assert (<= 0 stack__stack_type__pointer__first__bit))

;; stack__stack_type__pointer__last__bit_axiom
  (assert
  (< stack__stack_type__pointer__first__bit stack__stack_type__pointer__last__bit))

;; stack__stack_type__pointer__position_axiom
  (assert (<= 0 stack__stack_type__pointer__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((stack_type__ref 0))
(((stack_type__refqtmk (stack_type__content us_rep)))))
(define-fun stack_type__ref_stack_type__content__projection ((a stack_type__ref)) us_rep 
  (stack_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun count (us_split_fields) Int)

(declare-fun count__function_guard (Int us_split_fields) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (natural natural) Bool)

(declare-const dummy4 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

;; count__post_axiom
  (assert
  (forall ((stack__my_stack__fields us_split_fields))
  (! (let ((result (count stack__my_stack__fields)))
     (=> (count__function_guard result stack__my_stack__fields)
     (dynamic_invariant1 result true false true true))) :pattern ((count
                                                                  stack__my_stack__fields)) )))

;; count__def_axiom
  (assert
  (forall ((stack__my_stack__fields us_split_fields))
  (! (= (count stack__my_stack__fields) (to_rep1
                                        (rec__stack__stack_type__pointer
                                        (us_split_fields1
                                        (us_repqtmk stack__my_stack__fields))))) :pattern (
  (count stack__my_stack__fields)) )))

(declare-fun max_stack_size (tuple0) Int)

(declare-fun max_stack_size__function_guard (Int tuple0) Bool)

;; max_stack_size__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (max_stack_size us_void_param)))
     (=> (max_stack_size__function_guard result us_void_param)
     (dynamic_invariant1 result true false true true))) :pattern ((max_stack_size
                                                                  us_void_param)) )))

;; max_stack_size__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (max_stack_size us_void_param) 100) :pattern ((max_stack_size
                                                      us_void_param)) )))

(declare-fun stack_entry (Int us_split_fields) Int)

(declare-fun stack_entry__function_guard (Int Int us_split_fields) Bool)

;; stack_entry__post_axiom
  (assert
  (forall ((n Int))
  (forall ((stack__my_stack__fields us_split_fields))
  (! (and
     (forall ((stack__my_stack__fields1 us_split_fields))
     (count__function_guard (count stack__my_stack__fields1)
     stack__my_stack__fields1))
     (=>
     (and (dynamic_invariant1 n true true true true)
     (and (<= 1 n) (<= n (count stack__my_stack__fields))))
     (let ((result (stack_entry n stack__my_stack__fields)))
     (=> (stack_entry__function_guard result n stack__my_stack__fields)
     (dynamic_invariant result true false true true))))) :pattern ((stack_entry
                                                                   n
                                                                   stack__my_stack__fields)) ))))

;; stack_entry__def_axiom
  (assert
  (forall ((n Int))
  (forall ((stack__my_stack__fields us_split_fields))
  (! (=> (dynamic_invariant1 n true true true true)
     (= (stack_entry n stack__my_stack__fields) (to_rep
                                                (let ((temp___211 (rec__stack__stack_type__s
                                                                  (us_split_fields1
                                                                  (us_repqtmk
                                                                  stack__my_stack__fields)))))
                                                (select temp___211 n))))) :pattern (
  (stack_entry n stack__my_stack__fields)) ))))

(declare-fun is_full (us_split_fields) Bool)

(declare-fun is_full__function_guard (Bool us_split_fields) Bool)

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((stack__my_stack__fields us_split_fields))
  (! (and
     (forall ((stack__my_stack__fields1 us_split_fields))
     (count__function_guard (count stack__my_stack__fields1)
     stack__my_stack__fields1))
     (and (max_stack_size__function_guard (max_stack_size Tuple0) Tuple0)
     (= (= (is_full stack__my_stack__fields) true)
     (= (count stack__my_stack__fields) (max_stack_size Tuple0))))) :pattern (
  (is_full stack__my_stack__fields)) )))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort index_range 0)

(declare-fun index_rangeqtint (index_range) Int)

;; index_range'axiom
  (assert
  (forall ((i index_range))
  (and (<= 1 (index_rangeqtint i)) (<= (index_rangeqtint i) 100))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (index_range index_range) Bool)

(declare-const dummy5 index_range)

(declare-datatypes ((index_range__ref 0))
(((index_range__refqtmk (index_range__content index_range)))))
(define-fun index_range__ref_index_range__content__projection ((a index_range__ref)) index_range 
  (index_range__content a))

(define-fun dynamic_invariant2 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 100)) (in_range2 temp___expr_168)))

(define-fun dynamic_invariant3 ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 1 100)) (in_range4 temp___expr_175)))

(assert
;; defqtvc
 ;; File "stack.ads", line 50, characters 0-0
  (not
  (forall ((my_stack__split_fields us_split_fields) (o Int))
  (=> (dynamic_invariant x true false true true)
  (=>
  (forall ((my_stack__split_fields1 us_split_fields))
  (is_full__function_guard (is_full my_stack__split_fields1)
  my_stack__split_fields1))
  (=> (not (= (is_full my_stack__split_fields) true))
  (=>
  (= (to_rep1 (rec__stack__stack_type__pointer my_stack__split_fields)) o)
  (in_range2 (+ o 1)))))))))
(check-sat)
(exit)
