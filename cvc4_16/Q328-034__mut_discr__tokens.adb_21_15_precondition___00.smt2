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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

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

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep1
                           (rec__types__value__e (us_split_fields1 a))) 
                   (to_rep1 (rec__types__value__e (us_split_fields1 b))))
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

(declare-const types__value__e__first__bit Int)

(declare-const types__value__e__last__bit Int)

(declare-const types__value__e__position Int)

;; types__value__e__first__bit_axiom
  (assert (<= 0 types__value__e__first__bit))

;; types__value__e__last__bit_axiom
  (assert (< types__value__e__first__bit types__value__e__last__bit))

;; types__value__e__position_axiom
  (assert (<= 0 types__value__e__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content us_rep)))))
(define-fun value__ref_value__content__projection ((a value__ref)) us_rep 
  (value__content a))

(declare-sort token_kind 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (token_kind token_kind) Bool)

(declare-const dummy5 token_kind)

(declare-datatypes ((token_kind__ref 0))
(((token_kind__refqtmk (token_kind__content token_kind)))))
(define-fun token_kind__ref_token_kind__content__projection ((a token_kind__ref)) token_kind 
  (token_kind__content a))

(declare-fun to_rep2 (token_kind) Int)

(declare-fun of_rep2 (Int) token_kind)

;; inversion_axiom
  (assert
  (forall ((x token_kind))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x token_kind)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort operation 0)

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (operation operation) Bool)

(declare-const dummy6 operation)

(declare-datatypes ((operation__ref 0))
(((operation__refqtmk (operation__content operation)))))
(define-fun operation__ref_operation__content__projection ((a operation__ref)) operation 
  (operation__content a))

(declare-fun to_rep3 (operation) Int)

(declare-fun of_rep3 (Int) operation)

;; inversion_axiom
  (assert
  (forall ((x operation))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x operation)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort instruction 0)

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (instruction instruction) Bool)

(declare-const dummy7 instruction)

(declare-datatypes ((instruction__ref 0))
(((instruction__refqtmk (instruction__content instruction)))))
(define-fun instruction__ref_instruction__content__projection ((a instruction__ref)) instruction 
  (instruction__content a))

(declare-fun to_rep4 (instruction) Int)

(declare-fun of_rep4 (Int) instruction)

;; inversion_axiom
  (assert
  (forall ((x instruction))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x instruction)) (! (in_range6
  (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range6 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

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

(define-fun tokens__token__val__pred ((a us_rep1)) Bool (= (to_rep2
                                                           (rec__tokens__token__kind
                                                           (us_split_discrs1
                                                           a))) 0))

(define-fun tokens__token__op__pred ((a us_rep1)) Bool (= (to_rep2
                                                          (rec__tokens__token__kind
                                                          (us_split_discrs1
                                                          a))) 1))

(define-fun tokens__token__instr__pred ((a us_rep1)) Bool (= (to_rep2
                                                             (rec__tokens__token__kind
                                                             (us_split_discrs1
                                                             a))) 2))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep2
                            (rec__tokens__token__kind (us_split_discrs1 a))) 
                         (to_rep2
                         (rec__tokens__token__kind (us_split_discrs1 b))))
                         (and
                         (and
                         (=> (tokens__token__val__pred a)
                         (= (bool_eq2
                            (rec__tokens__token__val (us_split_fields3 a))
                            (rec__tokens__token__val (us_split_fields3 b))) true))
                         (=> (tokens__token__op__pred a)
                         (= (to_rep3
                            (rec__tokens__token__op (us_split_fields3 a))) 
                         (to_rep3
                         (rec__tokens__token__op (us_split_fields3 b))))))
                         (=> (tokens__token__instr__pred a)
                         (= (to_rep4
                            (rec__tokens__token__instr (us_split_fields3 a))) 
                         (to_rep4
                         (rec__tokens__token__instr (us_split_fields3 b)))))))
                    true false))

(define-fun in_range7 ((rec__tokens__token__kind1 Int)
  (a us_split_discrs)) Bool (= rec__tokens__token__kind1 (to_rep2
                                                         (rec__tokens__token__kind
                                                         a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

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

(declare-fun user_eq8 (us_rep1 us_rep1) Bool)

(declare-const dummy8 us_rep1)

(declare-datatypes ((token__ref 0))
(((token__refqtmk (token__content us_rep1)))))
(define-fun token__ref_token__content__projection ((a token__ref)) us_rep1 
  (token__content a))

(declare-const v__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_194 us_rep1)
  (temp___skip_top_level_195 Bool)) Bool (= (to_rep2
                                            (rec__tokens__token__kind
                                            (us_split_discrs1
                                            temp___expr_194))) 0))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r1b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const word__first integer)

(declare-const word__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r5b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun read (us_t) us_rep)

(declare-fun read__function_guard (us_rep us_t) Bool)

(declare-const r9b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant1 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-fun read1 (us_t) Int)

(declare-fun read__function_guard1 (Int us_t) Bool)

(define-fun dynamic_invariant2 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 3)) (in_range5 temp___expr_178)))

;; read__post_axiom
  (assert
  (forall ((op us_t))
  (! (=> (dynamic_invariant1 op true true true true)
     (let ((result (read1 op)))
     (=> (read__function_guard1 result op) (dynamic_invariant2 result true
     false true true)))) :pattern ((read1 op)) )))

(declare-const r13b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const r17b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r21b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-fun read2 (us_t) Int)

(declare-fun read__function_guard2 (Int us_t) Bool)

(define-fun dynamic_invariant3 ((temp___expr_185 Int)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (<= 0 2)) (in_range6 temp___expr_185)))

;; read__post_axiom
  (assert
  (forall ((word us_t))
  (! (=> (dynamic_invariant1 word true true true true)
     (let ((result (read2 word)))
     (=> (read__function_guard2 result word) (dynamic_invariant3 result true
     false true true)))) :pattern ((read2 word)) )))

(define-fun dynamic_invariant4 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 2)) (in_range4 temp___expr_163)))

(declare-sort tTword_bufferSP1 0)

(declare-fun tTword_bufferSP1qtint (tTword_bufferSP1) Int)

;; tTword_bufferSP1'axiom
  (assert
  (forall ((i tTword_bufferSP1))
  (and (<= 1 (tTword_bufferSP1qtint i)) (<= (tTword_bufferSP1qtint i) 1024))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 1024)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (tTword_bufferSP1 tTword_bufferSP1) Bool)

(declare-const dummy9 tTword_bufferSP1)

(declare-datatypes ((tTword_bufferSP1__ref 0))
(((tTword_bufferSP1__refqtmk (tTword_bufferSP1__content tTword_bufferSP1)))))
(define-fun tTword_bufferSP1__ref_tTword_bufferSP1__content__projection ((a tTword_bufferSP1__ref)) tTword_bufferSP1 
  (tTword_bufferSP1__content a))

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_t)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_t (t3b__content
                                                                  a))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const tokens__token__kind__first__bit1 Int)

(declare-const tokens__token__kind__last__bit1 Int)

(declare-const tokens__token__kind__position1 Int)

;; tokens__token__kind__first__bit_axiom
  (assert (<= 0 tokens__token__kind__first__bit1))

;; tokens__token__kind__last__bit_axiom
  (assert
  (< tokens__token__kind__first__bit1 tokens__token__kind__last__bit1))

;; tokens__token__kind__position_axiom
  (assert (<= 0 tokens__token__kind__position1))

(declare-const tokens__token__op__first__bit1 Int)

(declare-const tokens__token__op__last__bit1 Int)

(declare-const tokens__token__op__position1 Int)

;; tokens__token__op__first__bit_axiom
  (assert (<= 0 tokens__token__op__first__bit1))

;; tokens__token__op__last__bit_axiom
  (assert (< tokens__token__op__first__bit1 tokens__token__op__last__bit1))

;; tokens__token__op__position_axiom
  (assert (<= 0 tokens__token__op__position1))

(declare-const tokens__token__instr__first__bit1 Int)

(declare-const tokens__token__instr__last__bit1 Int)

(declare-const tokens__token__instr__position1 Int)

;; tokens__token__instr__first__bit_axiom
  (assert (<= 0 tokens__token__instr__first__bit1))

;; tokens__token__instr__last__bit_axiom
  (assert
  (< tokens__token__instr__first__bit1 tokens__token__instr__last__bit1))

;; tokens__token__instr__position_axiom
  (assert (<= 0 tokens__token__instr__position1))

(declare-const tokens__token__val__first__bit1 Int)

(declare-const tokens__token__val__last__bit1 Int)

(declare-const tokens__token__val__position1 Int)

;; tokens__token__val__first__bit_axiom
  (assert (<= 0 tokens__token__val__first__bit1))

;; tokens__token__val__last__bit_axiom
  (assert (< tokens__token__val__first__bit1 tokens__token__val__last__bit1))

;; tokens__token__val__position_axiom
  (assert (<= 0 tokens__token__val__position1))

(declare-fun user_eq10 (us_rep1 us_rep1) Bool)

(declare-const dummy10 us_rep1)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_rep1)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_rep1 
  (t6b__content a))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const tokens__token__kind__first__bit2 Int)

(declare-const tokens__token__kind__last__bit2 Int)

(declare-const tokens__token__kind__position2 Int)

;; tokens__token__kind__first__bit_axiom
  (assert (<= 0 tokens__token__kind__first__bit2))

;; tokens__token__kind__last__bit_axiom
  (assert
  (< tokens__token__kind__first__bit2 tokens__token__kind__last__bit2))

;; tokens__token__kind__position_axiom
  (assert (<= 0 tokens__token__kind__position2))

(declare-const tokens__token__val__first__bit2 Int)

(declare-const tokens__token__val__last__bit2 Int)

(declare-const tokens__token__val__position2 Int)

;; tokens__token__val__first__bit_axiom
  (assert (<= 0 tokens__token__val__first__bit2))

;; tokens__token__val__last__bit_axiom
  (assert (< tokens__token__val__first__bit2 tokens__token__val__last__bit2))

;; tokens__token__val__position_axiom
  (assert (<= 0 tokens__token__val__position2))

(declare-const tokens__token__instr__first__bit2 Int)

(declare-const tokens__token__instr__last__bit2 Int)

(declare-const tokens__token__instr__position2 Int)

;; tokens__token__instr__first__bit_axiom
  (assert (<= 0 tokens__token__instr__first__bit2))

;; tokens__token__instr__last__bit_axiom
  (assert
  (< tokens__token__instr__first__bit2 tokens__token__instr__last__bit2))

;; tokens__token__instr__position_axiom
  (assert (<= 0 tokens__token__instr__position2))

(declare-const tokens__token__op__first__bit2 Int)

(declare-const tokens__token__op__last__bit2 Int)

(declare-const tokens__token__op__position2 Int)

;; tokens__token__op__first__bit_axiom
  (assert (<= 0 tokens__token__op__first__bit2))

;; tokens__token__op__last__bit_axiom
  (assert (< tokens__token__op__first__bit2 tokens__token__op__last__bit2))

;; tokens__token__op__position_axiom
  (assert (<= 0 tokens__token__op__position2))

(declare-fun user_eq11 (us_rep1 us_rep1) Bool)

(declare-const dummy11 us_rep1)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_rep1)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_rep1 
  (t10b__content a))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const tokens__token__kind__first__bit3 Int)

(declare-const tokens__token__kind__last__bit3 Int)

(declare-const tokens__token__kind__position3 Int)

;; tokens__token__kind__first__bit_axiom
  (assert (<= 0 tokens__token__kind__first__bit3))

;; tokens__token__kind__last__bit_axiom
  (assert
  (< tokens__token__kind__first__bit3 tokens__token__kind__last__bit3))

;; tokens__token__kind__position_axiom
  (assert (<= 0 tokens__token__kind__position3))

(declare-const tokens__token__op__first__bit3 Int)

(declare-const tokens__token__op__last__bit3 Int)

(declare-const tokens__token__op__position3 Int)

;; tokens__token__op__first__bit_axiom
  (assert (<= 0 tokens__token__op__first__bit3))

;; tokens__token__op__last__bit_axiom
  (assert (< tokens__token__op__first__bit3 tokens__token__op__last__bit3))

;; tokens__token__op__position_axiom
  (assert (<= 0 tokens__token__op__position3))

(declare-const tokens__token__instr__first__bit3 Int)

(declare-const tokens__token__instr__last__bit3 Int)

(declare-const tokens__token__instr__position3 Int)

;; tokens__token__instr__first__bit_axiom
  (assert (<= 0 tokens__token__instr__first__bit3))

;; tokens__token__instr__last__bit_axiom
  (assert
  (< tokens__token__instr__first__bit3 tokens__token__instr__last__bit3))

;; tokens__token__instr__position_axiom
  (assert (<= 0 tokens__token__instr__position3))

(declare-const tokens__token__val__first__bit3 Int)

(declare-const tokens__token__val__last__bit3 Int)

(declare-const tokens__token__val__position3 Int)

;; tokens__token__val__first__bit_axiom
  (assert (<= 0 tokens__token__val__first__bit3))

;; tokens__token__val__last__bit_axiom
  (assert (< tokens__token__val__first__bit3 tokens__token__val__last__bit3))

;; tokens__token__val__position_axiom
  (assert (<= 0 tokens__token__val__position3))

(declare-fun user_eq12 (us_rep1 us_rep1) Bool)

(declare-const dummy12 us_rep1)

(declare-datatypes ((t14b__ref 0))
(((t14b__refqtmk (t14b__content us_rep1)))))
(define-fun t14b__ref_t14b__content__projection ((a t14b__ref)) us_rep1 
  (t14b__content a))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const alignment6 Int)

;; value__size_axiom
  (assert (<= 0 value__size6))

;; object__size_axiom
  (assert (<= 0 object__size6))

;; alignment_axiom
  (assert (<= 0 alignment6))

(declare-const tokens__token__kind__first__bit4 Int)

(declare-const tokens__token__kind__last__bit4 Int)

(declare-const tokens__token__kind__position4 Int)

;; tokens__token__kind__first__bit_axiom
  (assert (<= 0 tokens__token__kind__first__bit4))

;; tokens__token__kind__last__bit_axiom
  (assert
  (< tokens__token__kind__first__bit4 tokens__token__kind__last__bit4))

;; tokens__token__kind__position_axiom
  (assert (<= 0 tokens__token__kind__position4))

(declare-const tokens__token__val__first__bit4 Int)

(declare-const tokens__token__val__last__bit4 Int)

(declare-const tokens__token__val__position4 Int)

;; tokens__token__val__first__bit_axiom
  (assert (<= 0 tokens__token__val__first__bit4))

;; tokens__token__val__last__bit_axiom
  (assert (< tokens__token__val__first__bit4 tokens__token__val__last__bit4))

;; tokens__token__val__position_axiom
  (assert (<= 0 tokens__token__val__position4))

(declare-const tokens__token__instr__first__bit4 Int)

(declare-const tokens__token__instr__last__bit4 Int)

(declare-const tokens__token__instr__position4 Int)

;; tokens__token__instr__first__bit_axiom
  (assert (<= 0 tokens__token__instr__first__bit4))

;; tokens__token__instr__last__bit_axiom
  (assert
  (< tokens__token__instr__first__bit4 tokens__token__instr__last__bit4))

;; tokens__token__instr__position_axiom
  (assert (<= 0 tokens__token__instr__position4))

(declare-const tokens__token__op__first__bit4 Int)

(declare-const tokens__token__op__last__bit4 Int)

(declare-const tokens__token__op__position4 Int)

;; tokens__token__op__first__bit_axiom
  (assert (<= 0 tokens__token__op__first__bit4))

;; tokens__token__op__last__bit_axiom
  (assert (< tokens__token__op__first__bit4 tokens__token__op__last__bit4))

;; tokens__token__op__position_axiom
  (assert (<= 0 tokens__token__op__position4))

(declare-fun user_eq13 (us_rep1 us_rep1) Bool)

(declare-const dummy13 us_rep1)

(declare-datatypes ((t18b__ref 0))
(((t18b__refqtmk (t18b__content us_rep1)))))
(define-fun t18b__ref_t18b__content__projection ((a t18b__ref)) us_rep1 
  (t18b__content a))

(declare-const value__size7 Int)

(declare-const object__size7 Int)

(declare-const alignment7 Int)

;; value__size_axiom
  (assert (<= 0 value__size7))

;; object__size_axiom
  (assert (<= 0 object__size7))

;; alignment_axiom
  (assert (<= 0 alignment7))

(declare-const tokens__token__kind__first__bit5 Int)

(declare-const tokens__token__kind__last__bit5 Int)

(declare-const tokens__token__kind__position5 Int)

;; tokens__token__kind__first__bit_axiom
  (assert (<= 0 tokens__token__kind__first__bit5))

;; tokens__token__kind__last__bit_axiom
  (assert
  (< tokens__token__kind__first__bit5 tokens__token__kind__last__bit5))

;; tokens__token__kind__position_axiom
  (assert (<= 0 tokens__token__kind__position5))

(declare-const tokens__token__val__first__bit5 Int)

(declare-const tokens__token__val__last__bit5 Int)

(declare-const tokens__token__val__position5 Int)

;; tokens__token__val__first__bit_axiom
  (assert (<= 0 tokens__token__val__first__bit5))

;; tokens__token__val__last__bit_axiom
  (assert (< tokens__token__val__first__bit5 tokens__token__val__last__bit5))

;; tokens__token__val__position_axiom
  (assert (<= 0 tokens__token__val__position5))

(declare-const tokens__token__op__first__bit5 Int)

(declare-const tokens__token__op__last__bit5 Int)

(declare-const tokens__token__op__position5 Int)

;; tokens__token__op__first__bit_axiom
  (assert (<= 0 tokens__token__op__first__bit5))

;; tokens__token__op__last__bit_axiom
  (assert (< tokens__token__op__first__bit5 tokens__token__op__last__bit5))

;; tokens__token__op__position_axiom
  (assert (<= 0 tokens__token__op__position5))

(declare-const tokens__token__instr__first__bit5 Int)

(declare-const tokens__token__instr__last__bit5 Int)

(declare-const tokens__token__instr__position5 Int)

;; tokens__token__instr__first__bit_axiom
  (assert (<= 0 tokens__token__instr__first__bit5))

;; tokens__token__instr__last__bit_axiom
  (assert
  (< tokens__token__instr__first__bit5 tokens__token__instr__last__bit5))

;; tokens__token__instr__position_axiom
  (assert (<= 0 tokens__token__instr__position5))

(declare-fun user_eq14 (us_rep1 us_rep1) Bool)

(declare-const dummy14 us_rep1)

(declare-datatypes ((t22b__ref 0))
(((t22b__refqtmk (t22b__content us_rep1)))))
(define-fun t22b__ref_t22b__content__projection ((a t22b__ref)) us_rep1 
  (t22b__content a))

(define-fun dynamic_invariant5 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant6 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(assert
;; defqtvc
 ;; File "tokens.ads", line 19, characters 0-0
  (not
  (forall ((word_size Int) (word_size1 Int) (o integer) (o1 integer))
  (=> (dynamic_invariant word_size false false true true)
  (=> (dynamic_invariant word_size1 false true true true)
  (=> (= (to_rep1 o) 1024)
  (=> (= (to_rep1 o1) 1) (<= 1024 (length (to_rep1 o1) (to_rep1 o))))))))))
(check-sat)
(exit)
