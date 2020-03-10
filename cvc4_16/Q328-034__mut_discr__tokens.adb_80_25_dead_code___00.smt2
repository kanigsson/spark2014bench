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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__types__value__e integer)))))
(define-fun us_split_fields_rec__types__value__e__projection ((a us_split_fields)) integer 
  (rec__types__value__e a))

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
                           (rec__types__value__e (us_split_fields1 a))) 
                   (to_rep (rec__types__value__e (us_split_fields1 b)))) true
                   false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const types__value__e__first__bit Int)

(declare-const types__value__e__last__bit Int)

(declare-const types__value__e__position Int)

;; types__value__e__first__bit_axiom
  (assert (<= 0 types__value__e__first__bit))

;; types__value__e__last__bit_axiom
  (assert (< types__value__e__first__bit types__value__e__last__bit))

;; types__value__e__position_axiom
  (assert (<= 0 types__value__e__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content us_rep)))))
(define-fun value__ref_value__content__projection ((a value__ref)) us_rep 
  (value__content a))

(declare-sort token_kind 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (token_kind token_kind) Bool)

(declare-const dummy2 token_kind)

(declare-datatypes ((token_kind__ref 0))
(((token_kind__refqtmk (token_kind__content token_kind)))))
(define-fun token_kind__ref_token_kind__content__projection ((a token_kind__ref)) token_kind 
  (token_kind__content a))

(declare-fun to_rep1 (token_kind) Int)

(declare-fun of_rep1 (Int) token_kind)

;; inversion_axiom
  (assert
  (forall ((x token_kind))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x token_kind)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort operation 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (operation operation) Bool)

(declare-const dummy3 operation)

(declare-datatypes ((operation__ref 0))
(((operation__refqtmk (operation__content operation)))))
(define-fun operation__ref_operation__content__projection ((a operation__ref)) operation 
  (operation__content a))

(declare-fun to_rep2 (operation) Int)

(declare-fun of_rep2 (Int) operation)

;; inversion_axiom
  (assert
  (forall ((x operation))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x operation)) (! (in_range3
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort instruction 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (instruction instruction) Bool)

(declare-const dummy4 instruction)

(declare-datatypes ((instruction__ref 0))
(((instruction__refqtmk (instruction__content instruction)))))
(define-fun instruction__ref_instruction__content__projection ((a instruction__ref)) instruction 
  (instruction__content a))

(declare-fun to_rep3 (instruction) Int)

(declare-fun of_rep3 (Int) instruction)

;; inversion_axiom
  (assert
  (forall ((x instruction))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x instruction)) (! (in_range4
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__tokens__token__kind token_kind)))))
(define-fun us_split_discrs_rec__tokens__token__kind__projection ((a us_split_discrs)) token_kind 
  (rec__tokens__token__kind a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__tokens__token__val us_rep)(rec__tokens__token__op operation)(rec__tokens__token__instr instruction)))))
(define-fun us_split_fields_rec__tokens__token__val__projection ((a us_split_fields2)) us_rep 
  (rec__tokens__token__val a))

(define-fun us_split_fields_rec__tokens__token__op__projection ((a us_split_fields2)) operation 
  (rec__tokens__token__op a))

(define-fun us_split_fields_rec__tokens__token__instr__projection ((a us_split_fields2)) instruction 
  (rec__tokens__token__instr a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun tokens__token__val__pred ((a us_rep1)) Bool (= (to_rep1
                                                           (rec__tokens__token__kind
                                                           (us_split_discrs1
                                                           a))) 0))

(define-fun tokens__token__op__pred ((a us_rep1)) Bool (= (to_rep1
                                                          (rec__tokens__token__kind
                                                          (us_split_discrs1
                                                          a))) 1))

(define-fun tokens__token__instr__pred ((a us_rep1)) Bool (= (to_rep1
                                                             (rec__tokens__token__kind
                                                             (us_split_discrs1
                                                             a))) 2))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__tokens__token__kind (us_split_discrs1 a))) 
                         (to_rep1
                         (rec__tokens__token__kind (us_split_discrs1 b))))
                         (and
                         (and
                         (=> (tokens__token__val__pred a)
                         (= (bool_eq
                            (rec__tokens__token__val (us_split_fields3 a))
                            (rec__tokens__token__val (us_split_fields3 b))) true))
                         (=> (tokens__token__op__pred a)
                         (= (to_rep2
                            (rec__tokens__token__op (us_split_fields3 a))) 
                         (to_rep2
                         (rec__tokens__token__op (us_split_fields3 b))))))
                         (=> (tokens__token__instr__pred a)
                         (= (to_rep3
                            (rec__tokens__token__instr (us_split_fields3 a))) 
                         (to_rep3
                         (rec__tokens__token__instr (us_split_fields3 b)))))))
                    true false))

(define-fun in_range5 ((rec__tokens__token__kind1 Int)
  (a us_split_discrs)) Bool (= rec__tokens__token__kind1 (to_rep1
                                                         (rec__tokens__token__kind
                                                         a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const tokens__token__kind__first__bit Int)

(declare-const tokens__token__kind__last__bit Int)

(declare-const tokens__token__kind__position Int)

;; tokens__token__kind__first__bit_axiom
  (assert (<= 0 tokens__token__kind__first__bit))

;; tokens__token__kind__last__bit_axiom
  (assert (< tokens__token__kind__first__bit tokens__token__kind__last__bit))

;; tokens__token__kind__position_axiom
  (assert (<= 0 tokens__token__kind__position))

(declare-const tokens__token__val__first__bit Int)

(declare-const tokens__token__val__last__bit Int)

(declare-const tokens__token__val__position Int)

;; tokens__token__val__first__bit_axiom
  (assert (<= 0 tokens__token__val__first__bit))

;; tokens__token__val__last__bit_axiom
  (assert (< tokens__token__val__first__bit tokens__token__val__last__bit))

;; tokens__token__val__position_axiom
  (assert (<= 0 tokens__token__val__position))

(declare-const tokens__token__op__first__bit Int)

(declare-const tokens__token__op__last__bit Int)

(declare-const tokens__token__op__position Int)

;; tokens__token__op__first__bit_axiom
  (assert (<= 0 tokens__token__op__first__bit))

;; tokens__token__op__last__bit_axiom
  (assert (< tokens__token__op__first__bit tokens__token__op__last__bit))

;; tokens__token__op__position_axiom
  (assert (<= 0 tokens__token__op__position))

(declare-const tokens__token__instr__first__bit Int)

(declare-const tokens__token__instr__last__bit Int)

(declare-const tokens__token__instr__position Int)

;; tokens__token__instr__first__bit_axiom
  (assert (<= 0 tokens__token__instr__first__bit))

;; tokens__token__instr__last__bit_axiom
  (assert
  (< tokens__token__instr__first__bit tokens__token__instr__last__bit))

;; tokens__token__instr__position_axiom
  (assert (<= 0 tokens__token__instr__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((token__ref 0))
(((token__refqtmk (token__content us_rep1)))))
(define-fun token__ref_token__content__projection ((a token__ref)) us_rep1 
  (token__content a))

(define-fun default_initial_assumption ((temp___expr_194 us_rep1)
  (temp___skip_top_level_195 Bool)) Bool (= (to_rep1
                                            (rec__tokens__token__kind
                                            (us_split_discrs1
                                            temp___expr_194))) 0))

(declare-const t us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun full (Int) Bool)

(declare-fun full__function_guard (Bool Int) Bool)

(declare-sort tlastS 0)

(declare-fun tlastSqtint (tlastS) Int)

;; tlastS'axiom
  (assert
  (forall ((i tlastS)) (and (<= 0 (tlastSqtint i)) (<= (tlastSqtint i) 200))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 200)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (tlastS tlastS) Bool)

(declare-const dummy6 tlastS)

(declare-datatypes ((tlastS__ref 0))
(((tlastS__refqtmk (tlastS__content tlastS)))))
(define-fun tlastS__ref_tlastS__content__projection ((a tlastS__ref)) tlastS 
  (tlastS__content a))

(define-fun dynamic_invariant ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 0 200)) (in_range6 temp___expr_206)))

;; full__post_axiom
  (assert true)

;; full__def_axiom
  (assert
  (forall ((stack__last Int))
  (! (= (= (full stack__last) true) (<= 200 stack__last)) :pattern ((full
                                                                    stack__last)) )))

(declare-fun size (Int) Int)

(declare-fun size__function_guard (Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; size__post_axiom
  (assert
  (forall ((stack__last Int))
  (! (=> (dynamic_invariant stack__last true true true true)
     (let ((result (size stack__last)))
     (=> (size__function_guard result stack__last) (dynamic_invariant1 result
     true false true true)))) :pattern ((size stack__last)) )))

;; size__def_axiom
  (assert
  (forall ((stack__last Int))
  (! (=> (dynamic_invariant stack__last true true true true)
     (= (size stack__last) stack__last)) :pattern ((size stack__last)) )))

(define-fun dynamic_invariant2 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 2)) (in_range2 temp___expr_163)))

(define-fun dynamic_invariant3 ((temp___expr_185 Int)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (<= 0 2)) (in_range4 temp___expr_185)))

(define-fun dynamic_invariant4 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 3)) (in_range3 temp___expr_178)))

(assert
;; defqtvc
 ;; File "tokens.ads", line 23, characters 0-0
  (not
  (forall ((last Int) (o Int) (spark__branch Bool) (o1 Int)
  (spark__branch1 Bool))
  (=> (dynamic_invariant last true false true true)
  (=> (forall ((last1 Int)) (full__function_guard (full last1) last1))
  (=> (forall ((last1 Int)) (size__function_guard (size last1) last1))
  (=>
  (=> (= (to_rep1 (rec__tokens__token__kind (us_split_discrs1 t))) 0)
  (and (not (= (full last) true))
  (=> (= (to_rep1 (rec__tokens__token__kind (us_split_discrs1 t))) 1)
  (<= 2 (size last)))))
  (=> (= (to_rep1 (rec__tokens__token__kind (us_split_discrs1 t))) o)
  (=> (= spark__branch (ite (= o 0) true false))
  (=> (not (= spark__branch true))
  (=> (= (to_rep1 (rec__tokens__token__kind (us_split_discrs1 t))) o1)
  (=> (= spark__branch1 (ite (= o1 1) true false)) (= spark__branch1 true)))))))))))))
(check-sat)
(exit)
